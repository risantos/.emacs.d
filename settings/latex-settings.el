;;; latex --- Auctex and Latex-preview configuration
;;; Commentary:
;;; Code:
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

;; Always start the server for inverse search
(setq-default TeX-source-correlate-start-server 0)

(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (tex-pdf-mode 1)
            (TeX-source-correlate-mode 1)))

(latex-preview-pane-enable)

(provide 'latex-settings)
;;; latex-settings.el ends here
