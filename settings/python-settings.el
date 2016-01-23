;;; python.el --- configurations
;;; Commentary:
;;; Code:
(require 'python) ; python.el mode
(setq py-python-command "/usr/bin/python3")

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


;;  emacs IPython notebook
(require 'ein) ;; 
(use-package 'ein-mumamo)  ;; https://github.com/millejoh/ein-mumamo
 
(setq ein:complete-on-dot 1) ;; Start to autocomplete after a dot
(setq ein:use-auto-complete-superpack t) ;; Use autocomplete

(require 'pydoc-info) ;; pydoc info

;; Jedi - Python completion
(require 'ctable) ;; required for epc
(require 'deferred) ;; required for epc
(require 'epc) ;; required for jedi
(require 'python-environment) ;; required for jedi
(require 'jedi)
;(jedi:install-server) ;; use this first time using jedi
(setq jedi:setup-keys t)
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'ein:connect-mode-hook 'ein:jedi-setup) ;jedi for ein
(setq jedi:environment-root "jedi")
(setq jedi:environment-virtualenv
      (append python-environment-virtualenv
              '("--python" "/usr/bin/python3")))
(setq jedi:complete-on-dot t)

(use-package 'py-yapf)
(add-hook 'python-mode-hook 'py-yapf-enable-on-save)

(add-to-list 'auto-mode-alist '("\\.\\(pyx\\|Sconstruct\\)" . python-mode))

;; Keybindings
(eval-after-load 'python
  '(define-key python-mode-map (kbd "C-c ! o") 'python-shell-switch-to-shell))
(eval-after-load 'python
  '(define-key python-mode-map (kbd "C-c |") 'python-shell-send-region))

(provide 'python-settings)
;;; python-settings.el ends here
