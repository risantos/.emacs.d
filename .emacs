;; Settings Files PATH
(add-to-list 'load-path "~/.emacs.d/settings")
;; Define plugins PATH [for el-get]
(setq plugin-path "~/.emacs.d/el-get/")

;; Import Main Setting Files
(require 'custom-functions)
(require 'general-settings)
(require 'el-get-settings)

;;-------------------;;
;;  Plugins + Modes  ;;
;;-------------------;;

(include-elget-plugin "popup") ;; popup
(require 'popup)

(include-plugin "websocket") ;; Websocket
(require 'websocket)

(include-plugin "request") ;; Request
(require 'request)

(require 'yasnippet) ;; yasnippet
(yas-global-mode 1)

(require 'ido) ;; Interactively-Do-Things
(ido-mode 1)


;; -- Modes with separate settings-files -- ;;

(require 'auto-complete-settings) ;; Auto-complete
(require 'python-settings) ;; Python mode
(require 'latex-settings) ;; LaTeX and Auctex


;; -- Modes and their settings -- ;;

;; Helm
(require 'helm)
(require 'helm-descbinds)
(fset 'describe-bindings 'helm-descbinds)
(helm-mode 1)
(global-set-key (kbd "C-c h") 'helm-mini)

;; Org
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-directory "/home/rafael/Dropbox/org")
(setq org-default-notes-file "/home/rafael/Dropbox/org/notes.org")
(setq org-agenda-files "/home/rafael/Dropbox/org/agenda")
(setq org-mobile-directory "/home/rafael/Dropbox/Apps/MobileOrg")

;; Markdown
(include-plugin "markdown-mode")
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (append 
       (list '("\\.text" . markdown-mode) 
	     '("\\.md" . markdown-mode) 
	     '("\\.markdown" . markdown-mode) 
	     )
       auto-mode-alist))

;; Javascript
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq-default js2-basic-offset 4)

;; YAML
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;;=======================================================
;; 'custom' changes in separate file
;; (like custom-set-faces and custom-set-variables)
(load 
 (setq custom-file (expand-file-name "settings/custom.el" user-emacs-directory))
 'noerror)
