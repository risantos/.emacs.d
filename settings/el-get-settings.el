;; Set el-get PATH. Create it if non-existant
(setq elget-path plugin-path)
(unless (file-exists-p elget-path)
  (make-directory elget-path))

;; Add el-get to load PATH. Install it if non-existant
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; Packages to install
(setq 
 my-packages '(auctex
               auto-complete
               color-theme-solarized
               ein
               helm
               helm-descbinds
               jedi
               js2-mode
               magit
               magic-latex-buffer
               markdown-mode
               popup
               pydoc-info
               yasnippet
               yaml-mode
               ))   

;; Shallow clone, to avoid cloning whole history
(setq el-get-git-shallow-clone t)

;; Install/Sync
(el-get 'sync my-packages)

(provide 'el-get-settings)

