;;------------------------------;;
;;  General or Global Settings  ;;
;;------------------------------;;

;; Set PATH, because ".bashrc" isn't loaded
;; function from https://gist.github.com/jakemcc/3887459
(defun set-exec-path-from-shell-PATH ()
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo -n $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(if window-system (set-exec-path-from-shell-PATH))

;;----------------------;;
;;  Environment Tweaks  ;;
;;----------------------;;

(setq current-language-environment "English") ;; Language
(setq inhibit-startup-screen t) ;; Don't show the start-up Screen
(setq org-default-notes-file "~/Dropbox/org/orgmode.org"
 initial-buffer-choice  org-default-notes-file) ;; Open/Show file at Start-up

(menu-bar-mode 0) ;; toggle menu bar

(require 'tool-bar) ;; toggle toolbar
(tool-bar-mode 0)

(if window-system (scroll-bar-mode 0)) ;; toggle scroll bar

(require 'mwheel) ;; toggle mouse wheel support for scrolling
(mouse-wheel-mode 1)

(blink-cursor-mode 0) ;; Toggle cursor blink

(transient-mark-mode 1) ;; Transient-Mark Mode (highlight selections)

(require 'paren) ;; Highlight parentheses when cursor is near
(show-paren-mode 1)

(setq require-final-newline 1) ;; Require final newlines when saved
(setq next-line-add-newlines t) ;; Add new line when going to the next line

(global-linum-mode t) ;; Display line number at left
;; Display (current line, current collumn) numbering in status bar
(line-number-mode 1)
(column-number-mode 1)

(setq-default case-fold-search 1) ;; Ignore case when searching

;;--  Fill Collumn  +  Truncate Options  --;;
(setq-default fill-column 70) ;; number of characters to fill column 
(setq-default truncate-lines nil) ;; Toggle truncate
(setq truncate-partial-width-windows nil) ;; Truncate in partial-width windows

;;--  Default window width and height  --;;
(defun custom-set-frame-size ()
  (add-to-list 'default-frame-alist '(height . 50))
  (add-to-list 'default-frame-alist '(width . 178)))
(custom-set-frame-size)
(add-hook 'before-make-frame-hook 'custom-set-frame-size)

;; ;; Window modifications
;; (global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
;; (global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
;; (global-set-key (kbd "S-C-<down>") 'shrink-window)
;; (global-set-key (kbd "S-C-<up>") 'enlarge-window)

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

;; ;; Highlight line with cursor
;; (require 'highlight-current-line)
;; (global-hl-line-mode 1)
;; (setq highlight-current-line-globally t)
;; (setq highlight-current-line-high-faces nil)
;; (setq highlight-current-line-whole-line nil)
;; (setq hl-line-face (quote highlight))

;; Text decoration
(require 'font-lock)
;;(setq font-lock-maximum-decoration 1)
(global-font-lock-mode 1)
(global-hi-lock-mode nil)
(setq jit-lock-contextually 1)
(setq jit-lock-stealth-verbose 1)

(size-indication-mode 1) ;; if text has size information, change text size to reflect it

(setq backup-inhibited t) ;; disable backup
(setq auto-save-default nil) ;; disable auto save

(provide 'general-settings)
