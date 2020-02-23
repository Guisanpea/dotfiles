;;; alloy-mode.el --- Emacs major mode for Alloy language -*- lexical-binding: t; -*-

; This is an emacs major mode for Alloy3 that does keyword coloring
; and indentation.
; Copyright (C) 2002 Allison L Waingold (skippy AT mit DOT edu)

; This program is free software; you can redistribute it and/or
; modify it under the terms of the GNU General Public License
; as published by the Free Software Foundation; either version 2
; of the License, or (at your option) any later version.

; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.

; You should have received a copy of the GNU General Public License
; along with this program; if not, write to the Free Software
; Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

;;; Author: Allison L Waingold <skippy@mit.edu>
;;; URL: https://github.com/dwwmmn/alloy-mode
;;; Version: 0.0.1
;;; Package-Requires: ((emacs "24"))
;;; Keywords: alloy modeling
;;; Description: This is an emacs major mode for Alloy 3

(defvar alloy-font-lock-keywords
  ;; keywords
  `(,(rx symbol-start
         (or "sig" "fun" "det" "let" "extends" "abstract"
             "static" "disj" "option" "set" "all"
             "one" "lone" "some" "sole" "open"
             "uses" "run" "check" "eval" "for" "but" "none" "exactly"
             "univ" "iden" "in" "no" "not"
             "with" "sum" "if" "then" "else"
             "pred" "iff" "implies"
             "and" "or" ;; "=>" "=" "+" "-"
             )
         symbol-end)
    ;; block introducing keywords with immediately following colons.
    ,(rx symbol-start
         (or "module" "fact" "assert")
         symbol-end)
    ;; signatures
    (,(lambda (limit)
        (let ((limit (or (save-excursion (re-search-forward "{" limit t))
                         limit))
              (sig-start (rx (zero-or-one (or "lone" "abstract" "one") (+ blank)) "sig"))
              (sig-name (rx symbol-start
                            (group (and (1+ (or letter digit))
                                        (* (or letter digit ?_))))
                            )))
          (and (save-excursion (beginning-of-line) (looking-at sig-start))
               (re-search-forward sig-name limit t)
               (not (looking-at "{")))))
     (0 font-lock-type-face))
    ;; 'extends' keyword in signature definition
    (,(rx symbol-start "extends" (* blank)
          (and (1+ (or letter digit)) (* (or letter digit ?_))))
     (1 font-lock-type-face))
    ;; function
    (,(rx symbol-start "fun" (* blank)
          (and (1+ (or letter digit)) (* (or letter digit ?_))))
     (1 font-lock-function-name-face))
    ;; module
    (,(rx symbol-start (* blank)
          (and (1+ (or letter digit)) (* (or letter digit ?_))))
     (1 font-lock-function-name-face))
    ))

(defvar alloy-mode-map ()
  "Keymap used in `alloy-mode' buffers.")
(if alloy-mode-map
    nil
  (progn
    (setq alloy-mode-map (make-sparse-keymap))
    (define-key alloy-mode-map "\C-m" 'alloy-return)
))

(defun alloy-return (&optional arg)
  (interactive)
  (alloy-indent-line)
  (newline-and-indent)
)

(defvar alloy-mode-syntax-table nil
  "Syntax table used in `alloy-mode' buffers.")
(if alloy-mode-syntax-table
    nil
  (setq alloy-mode-syntax-table (make-syntax-table))
  (modify-syntax-entry ?\( "()" alloy-mode-syntax-table)
  (modify-syntax-entry ?\) ")(" alloy-mode-syntax-table)
  (modify-syntax-entry ?\[ "(]" alloy-mode-syntax-table)
  (modify-syntax-entry ?\] ")[" alloy-mode-syntax-table)
  (modify-syntax-entry ?\{ "(}" alloy-mode-syntax-table)
  (modify-syntax-entry ?\} "){" alloy-mode-syntax-table)
  ;; Add operator symbols misassigned in the std table
  (modify-syntax-entry ?\$ "."  alloy-mode-syntax-table)
  (modify-syntax-entry ?\% "."  alloy-mode-syntax-table)
  (modify-syntax-entry ?\& "."  alloy-mode-syntax-table)
  (modify-syntax-entry ?\* "."  alloy-mode-syntax-table)
  (modify-syntax-entry ?\+ "."  alloy-mode-syntax-table)
  (modify-syntax-entry ?\- "."  alloy-mode-syntax-table)
  (modify-syntax-entry ?\/ "."  alloy-mode-syntax-table)
  (modify-syntax-entry ?\< "."  alloy-mode-syntax-table)
  (modify-syntax-entry ?\= "."  alloy-mode-syntax-table)
  (modify-syntax-entry ?\> "."  alloy-mode-syntax-table)
  (modify-syntax-entry ?\| "."  alloy-mode-syntax-table)

  (modify-syntax-entry ?\_ "w"  alloy-mode-syntax-table)
  (modify-syntax-entry ?\' "w"  alloy-mode-syntax-table)
  (modify-syntax-entry ?\" "w"  alloy-mode-syntax-table)
  ;; backquote is open and close paren
  (modify-syntax-entry ?\` "$"  alloy-mode-syntax-table)
  ;; comment delimiters
  (modify-syntax-entry ?/  ". 124b" alloy-mode-syntax-table)
  (modify-syntax-entry ?*  ". 23"   alloy-mode-syntax-table)
  (modify-syntax-entry ?-  ". 12b" alloy-mode-syntax-table)
  (modify-syntax-entry ?\n "> b   "  alloy-mode-syntax-table)
  (modify-syntax-entry ?  "    " alloy-mode-syntax-table)
  (modify-syntax-entry ?\t "    " alloy-mode-syntax-table)
  (modify-syntax-entry ?\r "    " alloy-mode-syntax-table)
  (modify-syntax-entry ?\f "    " alloy-mode-syntax-table))

(defconst alloy-indent-expr
  "[{|]"
  (rx (any ?{ ?|)))

(defconst alloy-same-indent-expr
  (rx "&&" "||"))

(defconst alloy-start-inline-comment
  (rx (or "//" "--"))
  "Regexp describing start of an alloy comment.")

(defconst alloy-start-block-comment
  (rx "/*")
  "Regexp describing start of an alloy block comment.")

(defconst alloy-end-block-comment
  (rx "/*")
  "Regexp describing end of an alloy block comment.")

(defun start-of-line ()
  "Return the beginning of the line."
  (- (point) (current-column)))

(defun in-comment ()
  (save-excursion
    (let ((startpoint (point)))
      (or
       ;; We're looking at at comment
       (looking-at alloy-start-block-comment)
       (looking-at alloy-start-inline-comment)

       ;; We're inside an inline comment
       (progn
         (re-search-backward alloy-start-inline-comment (start-of-line) t 1)
         (< (point) startpoint))

       ;; We're inside a block comment
       (progn
         (goto-char startpoint)
         (re-search-backward alloy-start-block-comment nil t 1)
         (if (< (point) startpoint)
             ;; Make sure there's not a */ between us and the /* we just found.
             (let ((opencomm (point)))
               (goto-char startpoint)
               (re-search-backward alloy-end-block-comment opencomm t 1)
               (not (< (point) startpoint)))))))))

(defgroup alloy nil
  "Alloy-mode customizations."
  :group 'languages)

(defcustom alloy-basic-offset 3
  "Basic indentation offset."
  :type 'integer :group 'alloy)

(defconst regex-printable-chars
  (rx (not (any "\000-\040")))
  "Matches characters that are printable.")

(defun alloy-indent-line (&optional whole-exp)
  "Indent current line as Lisp code. With argument, indent any
additional lines of the same expression rigidly along with this
one."
  (interactive "P")
  (let ((indentcol 0))
    (save-excursion
      (let ((oldpoint (point))          ; Save point before doing anything
            (obrace 0)                  ; Opening brace at the end of the last line?
            (cbrace 0)                  ; Closing brace at end of our line?
            (sameindent nil)            ; Should we indent the same as the above line?
            comment-block               ; Did we hit a comment block?
            bolast last-indent last-end bol eol
            )
        (setq sameindent (in-comment))
        (beginning-of-line)
        (setq bol (point))
        (condition-case nil
            ;; This puts us at the last char on the line above.
            (re-search-backward regex-printable-chars)
          (error (setq indentcol 0)))
        (when (not sameindent)
          ;; Looking at previous line
          (setq obrace (looking-at alloy-indent-expr)
                sameindent (looking-at ",")
                comment-block (looking-at "/"))
          (when comment-block
            ;; Skip over comments, their indentation is different.
            (progn
              (re-search-backward alloy-start-block-comment nil t 1)
              (re-search-backward regex-printable-chars nil t 1)))
          (when (> (current-column) 0) (backward-char))
          (when (looking-at "=>") (setq obrace t))
          (when (looking-at alloy-same-indent-expr) (setq sameindent t))
          (beginning-of-line)
          (setq bolast (current-column))
          (re-search-forward regex-printable-chars)
          (backward-char)
          (setq last-indent (- (current-column) bolast))
          ;; Looking at current line
          (goto-char oldpoint)
          (end-of-line)
          (setq eol (point))
          (beginning-of-line)
          (re-search-forward regex-printable-chars eol t 1)
          (when (> (point) bol)
            (backward-char))
          (setq cbrace (looking-at "}")
                sameindent (looking-at "{"))
          ;; Now we decide what indentation we want.
          (if sameindent
              (setq indentcol last-indent)
            (if obrace
                (if cbrace
                    (setq indentcol last-indent)
                  (setq indentcol (+ last-indent alloy-basic-offset)))

              ;; If there isn't an opening brace at the end of the last line,
              ;; use the nearest enclosing sexp to determine indentation.
              (save-excursion
                (condition-case nil
                    (progn
                      (up-list 1)
                      (backward-sexp 1)

                      ;; If the enclosing sexp starts with ( or [
                      (if (looking-at "[\\(]")
                          (setq indentcol (+ 1 (current-column)))

                        ;; If enclosing sexp starts with {, indent from the line
                        ;; with the {
                        (progn
                          (beginning-of-line)
                          (re-search-forward regex-printable-chars)
                          (backward-char)
                          (setq indentcol
                                (if cbrace
                                    (current-column)
                                  (+ alloy-basic-offset (current-column)))))))
                (error (setq indentcol last-indent)))))))
        ;; Remove old indentation if needed
        (when (> (current-column) indentcol)
          (delete-region bol (point)))
        (indent-to indentcol)))
    ;; Position the point conveniently for the user
    (when (< (current-column) indentcol)
      (move-to-column indentcol))
    ;; TODO is this needed?
    nil
    ))

(defvar alloy-mode-hook nil
  "*List of functions to call when Alloy mode is invoked.
This hook is automatically executed after the `alloy-mode' is
fully loaded. This is a good place to add Alloy environment
specific bindings.")

;;;###autoload
(define-derived-mode alloy-mode prog-mode "Alloy"
  :group 'alloy
  (make-local-variable 'font-lock-defaults)
  (make-local-variable 'comment-start)
  (make-local-variable 'comment-end)
  (make-local-variable 'comment-start-skip)
  (make-local-variable 'comment-column)
  (make-local-variable 'comment-indent-function)
  (make-local-variable 'indent-line-function)
  (setq
    font-lock-defaults      '(alloy-font-lock-keywords)
    comment-start           "/* "
    comment-end             " */"
    comment-start-skip      "/\\*+ *"
    comment-column          40
    comment-indent-function 'java-comment-indent
    indent-line-function    'alloy-indent-line
    indent-tabs-mode        t
    tab-width               alloy-basic-offset)
  (use-local-map alloy-mode-map))

(add-to-list 'auto-mode-alist '("\\.als\\'" . alloy-mode))

(provide 'alloy-mode)
