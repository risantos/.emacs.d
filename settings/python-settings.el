;;; python.el --- configurations
;;; Commentary:
;;; Code:
(require 'python) ; python.el mode
(setq py-python-command "/usr/bin/python3")
(setq python-indent-offset 4)

(setq
 python-shell-interpreter "ipython3"
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")


;; Jedi - Python completion
(require 'ctable) ;; required for epc
(require 'deferred) ;; required for epc
(require 'epc) ;; required for jedi
(require 'python-environment) ;; required for jedi
(require 'jedi)
;(jedi:install-server) ;; use this first time using jedi
;(autoload 'jedi:setup "jedi" nil t)
(setq jedi:setup-keys t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:environment-root "jedi")
(setq jedi:environment-virtualenv
      (append python-environment-virtualenv
              '("--python" "/usr/bin/python3")))
(setq jedi:complete-on-dot t)


;;  emacs IPython notebook
(require 'ein) ;; 
; (require 'ein-mumamo)  ;; https://github.com/millejoh/ein-mumamo

(setq ein:use-auto-complete t)
;(setq ein:use-auto-complete-superpack t) ;; Use autocomplete
(setq ein:complete-on-dot t) ;; Start to autocomplete after a dot
(setq ein:use-smartrep)
;(setq ein:notebook-modes '(ein:notebook-mumamo-mode ein:notebook-plain-mode))
(setq ein:notebook-modes '(ein:notebook-multilang-mode ein:notebook-plain-mode ))
(add-hook 'ein:connect-mode-hook 'ein:jedi-setup)
;; (setq ein:worksheet-enable-undo yes)   ; no / yes / full (default is yes, full includes cells)


(require 'pydoc-info) ;; pydoc info


;; (require 'py-autopep8)
;; (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(require 'py-yapf)
(add-hook 'python-mode-hook 'py-yapf-enable-on-save)
;; (add-hook 'ein:notebook-python-mode-hook 'py-yapf-enable-on-save)

(add-to-list 'auto-mode-alist '("\\.\\(pyx\\|Sconstruct\\)" . python-mode))

;; Keybindings
(eval-after-load 'python
  '(define-key python-mode-map (kbd "C-c ! o") 'python-shell-switch-to-shell))
(eval-after-load 'python
  '(define-key python-mode-map (kbd "C-c |") 'python-shell-send-region))

(provide 'python-settings)
;;; python-settings.el ends here
