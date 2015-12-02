;;-----------------;;
;;  Auto-Complete  ;;
;;-----------------;;

(setq ac-directory (make-elget-path "auto-complete"))
(add-to-list 'load-path ac-directory)
(require 'auto-complete) 

(require 'auto-complete-config) 
(ac-config-default)
(global-auto-complete-mode t)
(setq-default ac-sources '(ac-source-yasnippet 
                           ac-source-abbrev
                           ac-source-dictionary
                           ac-source-words-in-same-mode-buffers))

;; Hack to fix ac-sources after pycomplete.el breaks it
(add-hook 'python-mode-hook
          '(lambda ()
             (setq ac-sources '(ac-source-yasnippet
                                ac-source-abbrev
                                ac-source-dictionary
                                ac-source-words-in-same-mode-buffers))))

;;-------------;;
;;  Yasnippet  ;;
;;-------------;;

(require 'yasnippet) ;; yasnippet
;(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode t)

;; ;; Remove Yasnippet's default tab key binding
;; (define-key yas-minor-mode-map (kbd "<tab>") nil)
;; (define-key yas-minor-mode-map (kbd "TAB") nil)

;; ;; Set Yasnippet's key binding to shift+tab
;; (define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)

;; ;; Alternatively use Control-c + tab
;; (define-key yas-minor-mode-map (kbd "\C-c TAB") 'yas-expand)


;; Set trigger key so that it can work together with yasnippet on
;; [TAB] key. If the word exists in yasnippet, pressing [TAB] will cause
;; yasnippet to activate. Otherwise, auto-complete will
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

;; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)
;; case sensitivity is important when finding matches
(setq ac-ignore-case nil)

(provide 'auto-complete-settings)
