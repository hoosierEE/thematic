;;; thematic-commands.el --- User commands for thematic theme swapping

;; Copyright (C) 2026

;; Author: Alex Shroyer
;; Keywords: themes, emacs
;; Version: 0.1
;; URL: https://github.com/alexshroyer/thematic

;;; Commentary:

;; User-facing commands for the thematic theme swapping interface.

;;; Code:

(require 'thematic)

;;;###autoload
(defun thematic-toggle-theme ()
  "Toggle between the current theme and a permutation with exactly 2 colors swapped."
  (interactive)
  (thematic-toggle-theme-permutation))

;;;###autoload
(defun thematic-reset-theme ()
  "Reset the theme to its original state."
  (interactive)
  (thematic-reset-theme-state))

;;;###autoload
(defun thematic-show-theme-state ()
  "Display the current theme state."
  (interactive)
  (let ((state (if (eq thematic-theme-state 'original)
                   "Original"
                 "Permuted")))
    (message "Current theme state: %s" state)))

(provide 'thematic-commands)

;;; thematic-commands.el ends here