;; Settings Files PATH
(add-to-list 'load-path "~/.emacs.d/settings")
;; Define plugins and themes PATH [for el-get]
(setq plugin-path "~/.emacs.d/el-get/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Import Main Setting Files
(require 'custom-functions)
(require 'general-settings)
(require 'el-get-settings)

;;-------------------;;
;;  Plugins + Modes  ;;
;;-------------------;;

(require 'color-theme-solarized)
(color-theme-solarized)

(include-elget-plugin "popup") ;; popup
(require 'popup)

(include-plugin "websocket") ;; Websocket
(require 'websocket)

(include-plugin "request") ;; Request
(require 'request)

(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

(require 'ido) ;; Interactively-Do-Things
(ido-mode 1)


;; -- Modes with separate settings-files -- ;;

(require 'auto-complete-settings) ;; Auto-complete + yasnippet
(require 'python-settings) ;; Python mode, ein, pydoc
(require 'latex-settings) ;; LaTeX and Auctex
(require 'org-settings) ;; Org-mode

;; -- Modes and their settings -- ;;

;; Helm
(require 'helm)
(require 'helm-descbinds)
(require 'helm-pydoc)
(fset 'describe-bindings 'helm-descbinds)
(helm-mode 1)
(global-set-key (kbd "C-c h") 'helm-mini)

;; Markdown
(include-plugin "markdown-mode")
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.\\(text\\|md\\|markdown\\)" . markdown-mode))

;; Gnuplot-mode
(require 'gnuplot)
(add-to-list 'auto-mode-alist '("\\.\\(gp\\|gnuplot\\|plt\\)$" . gnuplot-mode))

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
