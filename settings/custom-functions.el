;;; custom-functions -- added for general use
;;; Commentary:
;;; Code:

;; (text not wrapping in that paragraph)
(defun unfill-paragraph () 
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

;; (text wrapping in that region)
(defun unfill-region ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-region (region-beginning) (region-end) nil)))

;; system-type check
(defun system-is-win ()
  (interactive)
  (string-equal system-type "windows-nt"))
(defun system-is-mac ()
  (interactive)
  (string-equal system-type "darwin"))
(defun system-is-linux ()
  (interactive)
  (string-equal system-type "gnu/linux"))

(provide 'custom-functions)
;;; custom-functions.el ends here
