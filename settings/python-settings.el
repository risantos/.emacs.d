;------------------------;
;;; Python Programming ;;;
;------------------------;

;; -----------------------
;; python.el configuration
;; -----------------------

(require 'python) ; python.el mode

(setq
 python-shell-interpreter "ipython3"
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")


;;---------------------------------;;
;;  emacs IPython notebook config  ;;
;;---------------------------------;;

(include-plugin "emacs-ipython-notebook/lisp")
(require 'ein) ;; IPython notebook

(setq ein:complete-on-dot 1) ;; Start to autocomplete after a dot
(setq ein:use-auto-complete 1) ;; Use autocomplete
(setq ein:query-timeout 1000) ;; Timeout settings

;; Shortcut function to load notebooklist
(defun load-ein () 
  (ein:notebooklist-load)
  (interactive)
  (ein:notebooklist-open))


;;----------------------;;
;;  Misc Python Config  ;;
;;----------------------;;

(require 'pydoc-info) ;; pydoc info

;; jedi python completion
(include-elget-plugin "ctable")   ;; required for epc
(include-elget-plugin "deferred") ;; required for epc
(include-elget-plugin "epc")      ;; required for jedi
(include-elget-plugin "jedi")
(require 'jedi)
(setq jedi:setup-keys t)
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:ac-setup) ; auto-complete source
(setq jedi:complete-on-dot t)

;; Pyflakes, Flymake and Pycheckers integration
;; http://stackoverflow.com/a/1257306/347942
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pycheckers" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))
(add-hook 'python-mode-hook
	  (lambda ()
	    (unless (eq buffer-file-name nil) (flymake-mode 1))))

;; Set PYTHONPATH, because emacs doesn't load .bashrc
(defun set-python-path-from-shell-PYTHONPATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PYTHONPATH'")))
    (setenv "PYTHONPATH" path-from-shell)))

(if window-system (set-python-path-from-shell-PYTHONPATH))

(add-to-list 'auto-mode-alist '("\\.\\(pyx\\|Sconstruct\\)" . python-mode))

;; Keybindings
(eval-after-load 'python
  '(define-key python-mode-map (kbd "C-c !") 'python-shell-switch-to-shell))
(eval-after-load 'python
  '(define-key python-mode-map (kbd "C-c |") 'python-shell-send-region))

(provide 'python-settings)

