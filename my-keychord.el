;; ==================== key-chords ====================
(defun ardie/open-custom-scratch-if-nexist()
  (interactive)
  (if
      (and
       (null (window-right (car (window-list))))
       (not (null (window-right (nth 1 (window-list)))))
       )
                                      (delete-window)
    (progn
      (display-buffer (get-buffer-create "*ardie-scratch*"))
      (other-window 1)
      )))

(defun ardie/switch-right-window()
  (interactive)
  (interactive)
  (if
      (null (window-right (nth 1 (window-list))))
      (other-window 1)))

(defun ardie/switch-left-window()
  (interactive)
  (if
      (null (window-right (car (window-list))))
      (other-window 1)))
  
(require 'key-chord)
(key-chord-mode 1)

(key-chord-define-global "zx" 'previous-buffer)
(key-chord-define-global ",." 'next-buffer)
(key-chord-define-global "qw" 'undo)
(key-chord-define-global "pj" 'dabbrev-expand)
;; ===== stupid escaping slashes, my brain hurts
(key-chord-define-global "]\\" 'ardie/open-custom-scratch-if-nexist)

(key-chord-define-global "p[" 'ardie/switch-left-window)

(key-chord-define-global "[]" 'ardie/switch-right-window)
