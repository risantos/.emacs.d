;;; init.el --- main config file
;;; Commentary:
;;; Code:

;; Paths to Load:
(add-to-list 'load-path "~/.emacs.d/settings")
(setq plugin-path "~/.emacs.d/el-get/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; package.el + repositories:
(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))

;; Main Settings Files:
(require 'custom-functions)
(require 'el-get-settings)
(package-initialize) ;; loading packages from package.el
(require 'general-settings)


;; Theme:
(setq frame-background-mode 'dark)
(set-frame-parameter nil 'background-mode 'dark)
(setq solarized-termcolors 256)
(set-terminal-parameter nil 'background-mode 'nil)
(load-theme 'solarized t)

;; Dependencies:

(require 'popup)
(require 'websocket)
(require 'request)

;; ;; Multiple Major Modes
;; (require 'nxhtml)
;; (require 'mumamo)
;; (when (version<= "24.2" emacs-version)
;;   (eval-after-load "mumamo"
;;     '(setq mumamo-per-buffer-local-vars
;;            (delq 'buffer-file-name mumamo-per-buffer-local-vars))))
;; (custom-set-faces
;;    '(mumamo-background-chunk-major
;;      ((((class color) (min-colors 88) (background dark)) nil))))


(require 'magit) ;; git porcelain
(global-set-key (kbd "C-x g") 'magit-status)

(require 'ido) ;; Interactively-Do-Things
(ido-mode 1)

(require 'flycheck)
(global-flycheck-mode)

;; separate settings files

(require 'auto-complete-settings) ;; Auto-complete + yasnippet
(require 'python-settings) ;; Python mode, ein, pydoc, formatters
(require 'latex-settings) ;; LaTeX and Auctex settings
(require 'org-settings) ;; Org-mode settings

;; Modes + their settings

(require 'helm)
(require 'helm-config)
(require 'helm-descbinds)
(require 'helm-pydoc)
(fset 'describe-bindings 'helm-descbinds)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "M-X") 'helm-mini)
(global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(with-eval-after-load "python"
  (define-key python-mode-map (kbd "C-c C-d") 'helm-pydoc))

(helm-mode 1)

(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.\\(text\\|md\\|markdown\\)" . markdown-mode))

;; (require 'gnuplot) ;; deactivated as I've fully switched to Matplotlib
;; (add-to-list 'auto-mode-alist '("\\.\\(gp\\|gnuplot\\|plt\\)$" . gnuplot-mode))

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq-default js2-basic-offset 4)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines) ; add cursor to each line of active region
(global-set-key (kbd "C->") 'mc/mark-next-like-this) ; add cursor based on keywords in the buffer
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(add-hook 'doc-view-mode-hook           ;; This is here to fix line numbers in doc-view
          (lambda ()
            (linum-mode -1)
            ))
           

(global-set-key (kbd "C-g") 'keyboard-escape-quit)
;;; Custom changes: (like custom-set-faces and custom-set-variables)
(load
 (setq custom-file (expand-file-name "settings/custom.el" user-emacs-directory))
 'noerror)
;;; init.el ends here

