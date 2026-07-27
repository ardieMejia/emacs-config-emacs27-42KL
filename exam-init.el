



(defun ardie/buffer ()
  (interactive)
  (switch-to-buffer nil)
  )


(global-set-key (kbd "C-b") 'ardie/buffer)



;; memorize all this


(defun ardie/compile ()
  (interactive)
(compile (concat "gcc " (string-join (directory-files default-directory t "^[^_].*c$") " ")))
  
)



(defun ardie/full-compile ()
  (interactive)
(compile (concat "gcc -Wall -Werror -Wextra " (string-join (directory-files default-directory t "^[^_].*c$") " ")))
  
)


(global-set-key (kbd "<mouse-9>") 'ardie/compile)
(global-set-key (kbd "<C-mouse-9>") 'ardie/full-compile)

(add-hook 'focus-out-hook (lambda () (save-some-buffers t)))












(global-set-key (kbd "C-o") 'other-window)

(global-set-key (kbd "C-0") 'delete-window)

(global-set-key (kbd "M-a") 'backward-word)

(global-set-key (kbd "M-e") 'forward-word)






(global-set-key (kbd "C-3") 'split-window-right)





(defun ardie/compile ()
  (interactive)
  (compile (concat "gcc " (string-join (directory-files default-directory t "^[^_].*c$"))))
  )

(defun ardie/full-compile ()
  (interactive)
  (compile (concat "gcc -Wextra -Wall -Werror " (string-join (directory-files default-directory t "^[^_].*c$"))))
  )

(compile (concat "gcc " (string-join (directory-files default-directory t "^[^_].*c$"))))

(global-set-key (kbd "<mouse-9>") 'ardie/compile)

(global-set-key (kbd "<C-mouse-9>") 'ardie/full-compile)
	 
(compile (concat "gcc -Werror -Wall -Wextra " (string-join )))







(define-key c-mode-map (kbd "M-a") nil)
(define-key c-mode-map (kbd "M-e") nil)












