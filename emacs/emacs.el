(add-to-list 'load-path "~/.config/emacs/lisp/")

;;;; Smart Parentheses
(defun module/misc/smartparens ()
    (use-package smartparens
        :defer t
        :diminish ""
        :bind (("C-)" . sp-forward-slurp-sexp)
                  ("C-}" . sp-forward-barf-sexp)
                  ("C-(" . sp-splice-sexp))
        :config
        (progn
            (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
            (push 'yas-installed-snippets-dir yas-snippet-dirs))
        ))

(load-file "~/.config/emacs/modes.el")

(load-file "~/.config/emacs/font.el")
