;;------------------------;;
;;  LaTeX Configurations  ;;
;;------------------------;;

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(include-plugin "auctex")
(load "auctex.el" -1 1 1)
(load "preview-latex.el" -1 1 1)

  ;; (if (system-is-linux)
  ;;     (setq TeX-view-program-selection 
  ;;            (quote (((output-dvi style-pstricks) "dvips and gv") 
  ;;       	     (output-dvi "xdvi") 
  ;;       	     (output-pdf "evince")
  ;;       	     (output-html "xdg-open"))))))

;; Always start the server for inverse search
(setq-default TeX-source-correlate-start-server 0)

(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (tex-pdf-mode 1)
            (TeX-source-correlate-mode 1)))

;;--- Magic-Latex-Buffer ---;;
(require 'magic-latex-buffer)
(add-hook 'latex-mode-hook 'magic-latex-buffer)

;; ;; Turn off Magic-Latex-Buffer features
;; (setq magic-latex-enable-block-highlight nil
;;       magic-latex-enable-suscript        t
;;       magic-latex-enable-pretty-symbols  t
;;       magic-latex-enable-block-align     nil
;;       magic-latex-enable-inline-image    nil)


(provide 'latex-settings)

