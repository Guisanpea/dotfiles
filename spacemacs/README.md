If you want to import all files from spacemacs do it like this

```lisp
;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(load-file "~/.config/spacemacs/layers.el")

(load-file "~/.config/spacemacs/init.el")

;; Initialization function for user code.
;; It is called immediately after `dotspacemacs/init', before layer configuration
;; executes.
;;  This function is mostly useful for variables that need to be set
;; before packages are loaded. If you are unsure, you should try in setting them in
;; `dotspacemacs/user-config' first."
(load-file "~/.config/spacemacs/user-init.el")

;; Configuration function for user code.
;; This function is called at the very end of Spacemacs initialization after
;; layers configuration.
;; This is the place where most of your configurations should be done. Unless it is
;; explicitly specified that a variable should be set before a package is loaded,
;; you should place your code here."
(load-file "~/.config/spacemacs/user-config.el")

;; Rest of configuration
(load-file "~/.config/emacs/emacs.el")

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
    '(package-selected-packages
         (quote
             (helm-rtags google-c-style flycheck-ycmd flycheck-rtags disaster cquery cpp-auto-include company-ycmd ycmd request-deferred deferred company-rtags rtags company-c-headers clang-format ccls dap-mode bui tree-mode hackernews zenburn-theme zen-and-art-theme yasnippet-snippets xterm-color ws-butler writeroom-mode winum white-sand-theme which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme treemacs-projectile treemacs-evil toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit symon symbol-overlay sunny-day-theme sublime-themes subatomic256-theme subatomic-theme string-inflection spaceline-all-the-icons spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme restart-emacs rebecca-theme ranger rainbow-delimiters railscasts-theme purple-haze-theme pug-mode professional-theme prettier-js popwin planet-theme phpunit phpcbf php-extras php-auto-yasnippets phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el password-generator paradox overseer orgit organic-green-theme org-projectile org-present org-pomodoro org-mime org-download org-cliplink org-bullets org-brain open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme ob-elixir noflet nodejs-repl noctilux-theme naquadah-theme nameless mwim mvn mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme meghanada maven-test-mode material-theme markdown-toc majapahit-theme magit-svn magit-gitflow madhat2r-theme macrostep lush-theme lsp-ui lsp-treemacs lsp-scala lsp-java lorem-ipsum livid-mode link-hint light-soap-theme kaolin-themes json-navigator json-mode js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme inkpot-theme indent-guide impatient-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org-rifle helm-org helm-mode-manager helm-make helm-lsp helm-gtags helm-gitignore helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme groovy-mode groovy-imports grandshell-theme gradle-mode gotham-theme google-translate golden-ratio gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md ggtags gandalf-theme fuzzy font-lock+ flycheck-pos-tip flycheck-package flycheck-mix flycheck-credo flx-ido flatui-theme flatland-theme fill-column-indicator farmhouse-theme fancy-battery eziam-theme eyebrowse expand-region exotica-theme evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-smartparens evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help ensime emmet-mode elisp-slime-nav editorconfig dumb-jump drupal-mode dracula-theme dotenv-mode doom-themes doom-modeline django-theme diminish diff-hl devdocs define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme company-web company-tern company-statistics company-php company-lsp company-emacs-eclim column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme clean-aindent-mode chocolate-theme cherry-blossom-theme centered-cursor-mode busybee-theme bubbleberry-theme browse-at-remote birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes alchemist aggressive-indent afternoon-theme ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
```
