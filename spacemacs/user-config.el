(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (module/misc/smartparens)

  (setq web-mode-engines-alist
    '(("php"    . "\\.phtml\\'")
      ("blade"  . "\\.blade\\."))
  )
  (add-to-list 'auto-mode-alist '("\\.blade.php\\'" . web-mode))
  )
