;;; el-get -- getting packages through git
;;; Commentary:
;;; Code:

;; Set el-get PATH. Create it if non-existant
(setq elget-path plugin-path)
(unless (file-exists-p elget-path)
  (make-directory elget-path))

;; Fetch el-get if non-existant:
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; Packages to fetch/install
(setq 
 my-packages '(auctex
               auto-complete
               color-theme-solarized
               emacs-async
               flycheck
               ein
               gnuplot-mode
               helm
               helm-descbinds
               helm-pydoc
               jedi
               js2-mode
               latex-preview-pane
               magit
               markdown-mode
               multiple-cursors
               nxhtml
               popup
               pydoc-info
               python-environment
               yasnippet
               yaml-mode
               ))   

;; Shallow clone, to avoid cloning whole history
(setq el-get-git-shallow-clone t)

;; Install/Sync
(el-get 'sync my-packages)

(provide 'el-get-settings)
;;; el-get-settings.el ends here
