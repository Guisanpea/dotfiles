(autoload 'promela-mode "promela-mode" "PROMELA mode" nil t)
(setq auto-mode-alist
  (append
    (list
      (cons "\\.promela$"  'promela-mode)
      (cons "\\.spin$"     'promela-mode)
      (cons "\\.pml$"      'promela-mode)
      ;; (cons "\\.other-extensions$"     'promela-mode)
      )
    auto-mode-alist)
    )
