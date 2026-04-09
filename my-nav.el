(fset 'yes-or-no-p 'y-or-n-p)

(defun ardie/open-1 ()
  (interactive)
  (org-link-open-from-string "https://cdn.intra.42.fr/pdf/pdf/193172/en.subject.pdf")
  )
(defun ardie/open-2 ()
  (interactive)
  (org-link-open-from-string "https://cdn.intra.42.fr/pdf/pdf/202120/en.subject.pdf")
  )
(defun ardie/open-3 ()
  (interactive)
  (org-link-open-from-string "https://cdn.intra.42.fr/pdf/pdf/195096/en.subject.pdf")
  )
(defun ardie/open-slots ()
  (interactive)
  (org-link-open-from-string "https://profile.intra.42.fr/slots")
  )
(defun ardie/open-profile ()
  (interactive)
  (org-link-open-from-string "https://profile.intra.42.fr/slots")
  )
(defun ardie/open-project ()
  (interactive)
  (org-link-open-from-string "https://projects.intra.42.fr/")
  )




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



(defun my-copy-directory ()
  "get current directory into clipboard"
  (interactive)
  (kill-new default-directory)
  (print default-directory)
  )

(global-set-key (kbd "C-c m , d") 'my-copy-directory)
;; ==================================================

(setq my-symbol-numvar '("hi-green" "mouse-drag-and-drop-region" "hi-aquamarine" "show-paren-match" "diff-indicator-removed" "hi-salmon" ))
(defun my-symbol-no-pop ()
  (interactive)
  (setq my-symbol-numvar (append (cdr my-symbol-numvar)  (list (pop my-symbol-numvar))))
  (let ((ardie/the-text (buffer-substring-no-properties  (region-beginning) (region-end))))
  (highlight-phrase ardie/the-text (car my-symbol-numvar))
       )
  (print (car my-symbol-numvar))
(print "success")
)

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




(defun ardie/42-auto-indent()
  (interactive)
  (beginning-of-line)
  (forward-word)
  (backward-word)
  (delete-indentation)
  (forward-word)
  (backward-word)
  (newline)
  (insert "\t")
  )


(defun ardie/add-semicolon-at-c-eol ()
  (interactive)
  (move-end-of-line 1)
  (insert ";")
  ;; (c-indent-line-or-region)
  (delete-trailing-whitespace &optional START END)
  )

(global-set-key (kbd "<M-return>") 'ardie/add-semicolon-at-c-eol)
