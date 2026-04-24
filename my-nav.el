(fset 'yes-or-no-p 'y-or-n-p)

(defun ardie/open-1 ()
  (interactive)
  (org-link-open-from-string "https://projects.intra.42.fr/c-piscine-c-01/mine")
  ;; C01
  )
(defun ardie/open-2 ()
  (interactive)
  (org-link-open-from-string "https://projects.intra.42.fr/c-piscine-c-02/arwan")
  ;; C02
  )
(defun ardie/open-3 ()
  (interactive)
  (org-link-open-from-string "https://projects.intra.42.fr/projects/c-piscine-c-03")
  ;; C00
  )
(defun ardie/open-4 ()
  (interactive)
  (org-link-open-from-string "https://projects.intra.42.fr/projects/c-piscine-c-04")
  )
(defun ardie/open-slots ()
  (interactive)
  (org-link-open-from-string "https://profile.intra.42.fr/slots")
  )
(defun ardie/open-profile ()
  (interactive)
  (org-link-open-from-string "https://profile.intra.42.fr")
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

(setq ardie/current-antin nil)
(defun my-tab-highlight ()
  (interactive)
      (progn
	(highlight-phrase "\t" "org-habit-clear-face")
	)
  )
	

;; ==================================================


(defun my-tab-unhighlight ()
  (interactive)
      (progn
	(unhighlight-regexp "\t")
	)
  )

;; ==================================================


(setq my-symbol-numvar '("org-habit-clear-face" "mouse-drag-and-drop-region" "hi-aquamarine" "show-paren-match" "diff-refine-added" "hi-salmon" ))
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

(defun my-unsymbol ()
  (interactive)
  ;; (thing-at-point 'word 'no-properties)
  (setq var1 (buffer-substring-no-properties  (region-beginning) (region-end)))
  (setq var2 (string-replace ":" "" var1))
  (unhighlight-regexp var2)
  (pop-mark)
  )

(global-set-key (kbd "C-c u") 'my-unsymbol)

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




;; (defun ardie/42-auto-indent()
;;   (interactive)
;;   (beginning-of-line)
;;   (forward-word)
;;   (backward-word)
;;   (delete-indentation)
;;   (forward-word)
;;   (backward-word)
;;   (newline)
;;   (insert "\t")
;;   ;; but progn is bad!! I dunno
;;   (progn
;;     (whitespace-cleanup)
;;     )
;;   )
(defun ardie/42-auto-indent()
  (interactive)
  (beginning-of-line)
  (forward-word)
  (backward-word)
  (tab-to-tab-stop)
  (progn
    (whitespace-cleanup)
    )
  )


(defun ardie/add-semicolon-at-c-eol ()
  (interactive)
  (move-end-of-line 1)
  (insert ";")
  ;; (c-indent-line-or-region)
  (delete-trailing-whitespace &optional START END)
  )

(global-set-key (kbd "<M-return>") 'ardie/add-semicolon-at-c-eol)




;; ===== we should rewrite this using with-temp-buffer
(defun ardie/ugly-42-function()
(interactive)
(shell-command
 (concat
  "source /home/arwan/Documents/python_temp/myenv/bin/activate; cp "
  buffer-file-name
  " /home/arwan/my-trash/"
      (file-name-base (buffer-file-name))
  ".c"
  (shell-command-to-string "date +'%H%M%S'")

  )
 ;; main.c ";c_formatter_42 < ~/my-trash/delete/shellPractice/main.c > ~/my-trash/delete/shellPractice/NEW_main.c"
 
 )
(shell-command
 (concat
  "source /home/arwan/Documents/python_temp/myenv/bin/activate; c_formatter_42 < "
  buffer-file-name
  " > "
  default-directory    
  "NEW_"
  (file-name-base (buffer-file-name))
  ".c"
  )
 )
(shell-command
 (concat
      "mv "
  default-directory    
  "NEW_"
  (file-name-base (buffer-file-name))
  ".c"
  " "
  default-directory
  (file-name-base (buffer-file-name))
  ".c"
  ))
)




(defun close-all-buffers()
  (interactive)
  (dolist (ardie/a-buffer (buffer-list) )
    (let ((ardie/a-buffer-name
	   (buffer-name ardie/a-buffer)
	   ))
      (if (not (equal ardie/a-buffer-name "*ardie-scratch*"))
	  (if (not (string-match "Async Shell Command" ardie/a-buffer-name))
	      (kill-buffer ardie/a-buffer-name)
	    )
	nil))))
