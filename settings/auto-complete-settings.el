;;; completion -- auto complete and yasnippet
;;; Commentary:
;;; Code:

;; Autocomplete:
(require 'auto-complete) 
(require 'auto-complete-config) 
(ac-config-default)
(global-auto-complete-mode t)
(setq-default ac-sources '(ac-source-yasnippet 
                           ac-source-abbrev
                           ac-source-dictionary
                           ac-source-words-in-same-mode-buffers))
(setq ac-auto-start 2) ;; Start auto-completion after 2 characters of a word
(setq ac-ignore-case nil) ;; Case-sensitivity in auto-complete


;; Yasnippet:
(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/snippets" yas-installed-snippets-dir))
(yas-global-mode 1)

;; ;; Remove Yasnippet's default tab key binding
;; (define-key yas-minor-mode-map (kbd "<tab>") nil)
;; (define-key yas-minor-mode-map (kbd "TAB") nil)

;; ;; Set Yasnippet's key binding to shift+tab
;; (define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)

;; ;; Alternatively use Control-c + tab
;; (define-key yas-minor-mode-map (kbd "\C-c TAB") 'yas-expand)


;;; Autocomplete and YASnippet conflict:

;; Set trigger key so that it can work together with yasnippet on
;; [TAB] key. If the word exists in yasnippet, pressing [TAB] will
;; cause yasnippet to activate. Otherwise, auto-complete will
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")



(provide 'auto-complete-settings)
;;; auto-complete-settings.el ends here
