(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
    ;; Base distribution to use. This is a layer contained in the directory
    ;; `+distribution'. For now available distributions are `spacemacs-base'
    ;; or `spacemacs'. (default 'spacemacs)
    dotspacemacs-distribution 'spacemacs
    ;; Lazy installation of layers (i.e. layers are installed only when a file
    ;; with a supported type is opened). Possible values are `all', `unused'
    ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
    ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
    ;; lazy install any layer that support lazy installation even the layers
    ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
    ;; installation feature and you have to explicitly list a layer in the
    ;; variable `dotspacemacs-configuration-layers' to install it.
    ;; (default 'unused)
    dotspacemacs-enable-lazy-installation 'unused
    ;; If non-nil then Spacemacs will ask for confirmation before installing
    ;; a layer lazily. (default t)
    dotspacemacs-ask-for-lazy-installation t
    ;; If non-nil layers with lazy install support are lazy installed.
    ;; List of additional paths where to look for configuration layers.
    ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
    dotspacemacs-configuration-layer-path '()
    ;; List of configuration layers to load.
    dotspacemacs-configuration-layers
    '(
       (auto-completion :variables
         auto-completion-enable-sort-by-usage t
         auto-completion-enable-snippets-in-popup t)
       better-defaults
       c-c++
       dap
       elixir
       emacs-lisp
       git
       gtags
       helm
       (html :variables
         css-enable-lsp t
         web-fmt-tool 'prettier)
       javascript
       (latex :variables
         latex-build-command "LatexMk"
         latex-enable-folding t
         latex-enable-magic t)
       lsp
       markdown
       multiple-cursors
       org
       (osx :variables osx-option-as 'meta
            osx-right-option-as 'none)
       pdf
       php
       prettier
       (ranger :variables
         ranger-show-preview t
         ranger-cleanup-eagerly t
         ranger-cleanup-on-disable t
         ranger-ignored-extensions '("mkv" "flv" "iso" "mp4"))
       (scala :variables
         scala-backend 'scala-metals
         scala-auto-start-backend t)
       (shell :variables
         shell-default-height 30
         shell-default-position 'bottom)
       spacemacs-project
       syntax-checking
       version-control
       themes-megapack
       treemacs
       )
    ;; List of additional packages that will be installed without being
    ;; wrapped in a layer. If you need some configuration for these
    ;; packages, then consider creating a layer. You can also put the
    ;; configuration in `dotspacemacs/user-config'.
    dotspacemacs-additional-packages
    '(
       (editorconfig
         :ensure t
         :config
         (editorconfig-mode 1))
       evil-smartparens
       flatui-theme
       elixir-mode
       hackernews
       )

    ;; A list of packages that cannot be updated.
    dotspacemacs-frozen-packages '()
    ;; A list of packages that will not be installed and loaded.
    dotspacemacs-excluded-packages '(php-extras)
    ;; Defines the behaviour of Spacemacs when installing packages.
    ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
    ;; `used-only' installs only explicitly used packages and uninstall any
    ;; unused packages as well as their unused dependencies.
    ;; `used-but-keep-unused' installs only the used packages but won't uninstall
    ;; them if they become unused. `all' installs *all* packages supported by
    ;; Spacemacs and never uninstall them. (default is `used-only')
    dotspacemacs-install-packages 'used-only))
