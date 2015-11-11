;;--------------------;;
;;  Custom Functions  ;;
;;--------------------;;

;; Unfill Paragraph (text  doesn't wrap in the paragraph where the cursor is)
(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

;; Unfill Region (text doesn't wrap in that region)
(defun unfill-region ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-region (region-beginning) (region-end) nil)))

(defun system-is-win ()
  (interactive)
  (string-equal system-type "windows-nt"))

(defun system-is-mac ()
  (interactive)
  (string-equal system-type "darwin"))

(defun system-is-linux ()
  (interactive)
  (string-equal system-type "gnu/linux"))

(defun make-plugin-path (plugin)
  (expand-file-name
   (concat plugin-path plugin)))

(defun include-plugin (plugin)
  (add-to-list 'load-path (make-plugin-path plugin)))

(defun make-elget-path (plugin)
  (expand-file-name
   (concat elget-path plugin)))

(defun include-elget-plugin (plugin)
  (add-to-list 'load-path (make-elget-path plugin)))

(provide 'custom-functions)
