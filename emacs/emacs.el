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

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(setq-default TeX-engine 'xetex)
(setq-default TeX-PDF-mode t)

(load-file "~/.config/emacs/modes.el")

(load-file "~/.config/emacs/font.el")
