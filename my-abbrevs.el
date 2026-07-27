

(setq abbrev-file-name "/home/arwan/.temp/abbrev_defs")





;; (setq ardie/c-mode-abbrev-table (make-abbrev-table ))




(define-derived-mode ardie/c-mode c-mode  "ardie special c-mode"
  "A major mode for ardie/c-mode"
  :abbrev-table ardie/c-mode-abbrev-table
  ;; ===== we have to test if we still need this
  ;; (setq-local electric-pair-pairs '(
  ;; 		  (?\( . ?\))
  ;; 		  ))
  (abbrev-mode 1)
  )

(setq save-abbrevs 'silently) 


(defun ardie/add-to-our-abbrev-tables()
  (interactive)
  (if mark-active
      (let ((after (substring-no-properties (buffer-substring (region-beginning)(region-end)))))
        (exchange-point-and-mark)
        (pop-mark)
        (backward-char)
        (let ((before (substring-no-properties (word-at-point))))
	  (define-abbrev (symbol-value 'ardie/c-mode-abbrev-table) before after)
          ))
    (let ((after (substring-no-properties (word-at-point))))
      (backward-word)
      (backward-char)
      (let ((before (substring-no-properties (word-at-point))))
	(define-abbrev (symbol-value 'ardie/c-mode-abbrev-table) before after)
        ))
    )
  )
