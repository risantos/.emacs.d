;;------------;;
;;  Org-Mode  ;;
;;------------;;

(require 'org)

;; Setting global Keybindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; Org PATHS
(setq org-log-done t)
(setq org-directory "/home/rafael/Dropbox/org")
(setq org-default-notes-file "/home/rafael/Dropbox/org/notes.org")
(setq org-agenda-files "/home/rafael/Dropbox/org/agenda")
(setq org-mobile-directory "/home/rafael/Dropbox/Apps/MobileOrg")


;; ;; fix filladapt.el incompatibility
;; ;;(add-hook 'org-mode-hook 'turn-off-filladapt-mode)

;; To fix yasnippet and Org mode incompatibility
(add-hook 'org-mode-hook
                    (lambda ()
                      (org-set-local 'yas/trigger-key [tab])
                      (define-key yas/keymap [tab] 'yas/next-field-or-maybe-expand)))

(defun yas/org-very-safe-expand ()
            (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

(add-hook 'org-mode-hook
                    (lambda ()
                      (make-variable-buffer-local 'yas/trigger-key)
                      (setq yas/trigger-key [tab])
                      (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
                      (define-key yas/keymap [tab] 'yas/next-field)))

(provide 'org-settings)
