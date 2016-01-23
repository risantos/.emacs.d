;;; general  --- GUI, options, stuff
;;; Commentary:
;;; Code:

(defun set-exec-path-from-shell-PATH ()
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo -n $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(if window-system (set-exec-path-from-shell-PATH))


(setq current-language-environment "English") ;; Environment Language
(setq inhibit-startup-screen t) ;; Disable start-up Screen
(setq initial-buffer-choice "~/Dropbox/org/orgmode.org" ) ;; Start-up File

(menu-bar-mode 0) ;; Toggle menu bar

(require 'tool-bar) ;; Toggle toolbar
(tool-bar-mode 0)

(if window-system (scroll-bar-mode 0)) ;; Toggle scroll bar

(require 'mwheel) ;; Toggle mouse wheel support for scrolling
(mouse-wheel-mode 1)

(blink-cursor-mode 0) ;; Toggle cursor blink

(transient-mark-mode 1) ;; Transient-Mark Mode (highlight selections)

(global-hl-line-mode 1) ;; Highlight line with cursor

(require 'paren) ;; Highlight parentheses when cursor is near
(show-paren-mode 1)
(electric-pair-mode 1) ;; Insert matching brackets when typed

(setq require-final-newline 1) ;; Require final newlines when saved
(setq next-line-add-newlines t) ;; Add new line when going to the next line

(global-linum-mode t) ;; Display line number at left
;; Display (current line, current collumn) numbering in status bar
(line-number-mode nil)
(column-number-mode nil)

(setq-default case-fold-search 1) ;; Ignore case when searching

(setq-default fill-column 70) ;; Number of characters to fill column 
(setq-default truncate-lines nil) ;; Toggle truncate
(setq truncate-partial-width-windows nil) ;; Truncate in partial-width windosw

;; (defun custom-set-frame-size ()
;;   (add-to-list 'default-frame-alist '(height . 50))
;;   (add-to-list 'default-frame-alist '(width . 178)))
;; (custom-set-frame-size)
;; (add-hook 'before-make-frame-hook 'custom-set-frame-size)

;; Buffer window size modification keys
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Keybind [END/HOME] keys to [START/END] of buffers
(global-set-key (kbd "<end>") 'end-of-buffer)
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(define-key input-decode-map "\e[1;5A" [C-up])
(define-key input-decode-map "\e[1;5B" [C-down])

;; Indentation
(setq-default indent-tabs-mode nil) ;; Spaces as default, instead of tabs
(setq c-basic-offset 8) ;; Indentation styles
(setq c-default-style (quote (
    (c-mode . "bsd") 
    (java-mode . "java") 
    (awk-mode . "awk") 
    (other . "gnu"))))

(global-set-key [f4] 'goto-line) ;; Keybind [f4] key to [Go-to-line]


;; Text decoration
(require 'font-lock)
;;(setq font-lock-maximum-decoration 1)
(global-font-lock-mode 1)
(global-hi-lock-mode nil)
(setq jit-lock-contextually 1)
(setq jit-lock-stealth-verbose 1)

(size-indication-mode 1) ;; If text has size information, change text size to reflect it

(setq backup-inhibited t) ;; Disable backup
(setq auto-save-default nil) ;; Disable auto save

(provide 'general-settings)
;;; general-settings.el ends here
