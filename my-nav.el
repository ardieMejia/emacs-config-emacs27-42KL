(fset 'yes-or-no-p 'y-or-n-p)




;; ===== 2026: hydra cursor advice fix

(defun ardie/post-cursor-advice (num &optional character)
  "My advice for `foo`."
  ;; Example of around advice logic
  (set-cursor-color "#000000")
  (makunbound 'ardie/right-char-count)
  (makunbound 'ardie/left-char-count)
  )


(advice-add 'self-insert-command :before #'ardie/post-cursor-advice)
;; ==================================================

(defun my-mark-line ()
  (interactive)
  "my own mark lien"

  (if mark-active
      (progn
        (exchange-point-and-mark)
        (when
            (not (equal (window-end) (point)))
          (next-line)
          (move-end-of-line 1)
          )
        (exchange-point-and-mark)
	;; (scroll-up-line)
        )
    (progn
      (move-beginning-of-line 1)
      (set-mark (point))
      (move-end-of-line 1)
      (exchange-point-and-mark)
      )    
    )

  )


(add-hook 'focus-out-hook (lambda () (save-some-buffers t)))
