



;; ========== removing menu bars, and non-blinking cursor
(menu-bar-mode 1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)


;; ========== highlight
;; (global-hl-line-mode +1)

;; ========== no splash screen
(setq inhibit-startup-screen t)



(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 300)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(setq recentf-menu-filter "recentf-sort-ascending")

(run-at-time nil (* 5 60) 'recentf-save-list)


;; ========== 
(setq frame-title-format
      '((:eval (if (buffer-file-name)
       (abbreviate-file-name (buffer-file-name))
       "%b"))))

(setq backup-directory-alist '(("." . "~/backup/")))


(add-to-list 'load-path "/home/arwan/.temp/hydra/")
(add-to-list 'load-path "/home/arwan/.temp/compat/")
(add-to-list 'load-path "/home/arwan/.temp/drag-stuff/")



(load-file "/home/arwan/.temp/hydra/hydra.el")
(load-file "/home/arwan/.temp/key-chord.el")
(load-file "/home/arwan/.temp/my-hydra.el")
(load-file "/home/arwan/.temp/my-looks.el")
(load-file "/home/arwan/.temp/drag-stuff.el")













(add-hook 'emacs-lisp-mode-hook 'electric-pair-mode)
(add-hook 'python-mode-hook 'electric-pair-mode)









;; ========== electric-pair-mode FIX ==========
;; ===== taken from this link:
;; https://emacs.stackexchange.com/questions/13603/auctex-disable-electric-pair-mode-in-minibuffer-during-macro-definition
(defvar my-electic-pair-modes '(emacs-lisp-mode  python-mode  c-mode ))

(defun my-inhibit-electric-pair-mode (char)
  (not (member major-mode my-electic-pair-modes)))

(setq electric-pair-inhibit-predicate #'my-inhibit-electric-pair-mode)


;; ========== electric-pair-mode FIX ==========






(load-file "/home/arwan/.temp/my-hydra.el")
(load-file "/home/arwan/.temp/my-keychord.el")
(load-file "/home/arwan/.temp/my-nav.el")
(load-file "/home/arwan/.temp/projectile.el")





(eval-when-compile
  (defmacro compat--maybe-require ()
    (when (version< emacs-version "30.1")
      (require 'compat-30)
      '(require 'compat-30))))
(compat--maybe-require)



;; (load-file "/home/arwan/.temp/init-c.el")

