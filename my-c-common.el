



(defun my-tab()
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq tab-width 4)
  )

(add-hook 'c-mode-hook 'my-tab)
