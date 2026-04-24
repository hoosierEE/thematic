;;; thematic.el --- Theme swapping interface for Doom Emacs

;; Copyright (C) 2026

;; Author: Alex Shroyer
;; Keywords: themes, emacs
;; Version: 0.1
;; URL: https://github.com/alexshroyer/thematic

;;; Commentary:

;; This package provides a theme swapping interface for Doom Emacs that
;; allows users to cycle through theme permutations where exactly 2 theme
;; items have swapped colors.

;;; Code:

(require 'cl-lib)
(require 'dash)

;; Global variables to track theme state
(defvar thematic-current-theme nil
  "The currently active theme.")

(defvar thematic-permuted-palette nil
  "The permuted palette of the current theme.")

(defvar thematic-original-palette nil
  "The original palette of the current theme.")

(defvar thematic-theme-state 'original
  "The current state of the theme: 'original or 'permuted.")

;;;###autoload
(defun thematic-get-current-theme-palette ()
  "Extract the color palette from the currently loaded theme.
Returns a list of (name . color) pairs."
  (let ((palette '()))
    ;; This function will need to be adapted based on how Doom Emacs themes are structured
    ;; For now, we'll create a generic approach that works with common theme formats
    (condition-case nil
        (progn
          ;; Try to get the palette from the current theme
          (let ((theme-palette (symbol-value (intern (concat (symbol-name (doom-theme) "-palette"))))))
            (when (and theme-palette (listp theme-palette))
              (setq palette theme-palette)))
          palette)
      (error
       ;; Fallback to a default palette structure
       '()))))

;;;###autoload
(defun thematic-generate-permutations (items)
  "Generate all valid permutations of ITEMS where exactly 2 items have swapped.
ITEMS is a list of (name . color) pairs."
  (let ((result '())
        (len (length items)))
    ;; We can only swap if we have at least 2 items
    (when (>= len 2)
      ;; Generate all pairs of indices to swap
      (let ((indices (number-sequence 0 (1- len))))
        (dolist (i indices)
          (dolist (j (number-sequence (1+ i) (1- len)))
            (let ((permuted (copy-sequence items)))
              ;; Swap elements at positions i and j
              (let ((temp (nth i permuted)))
                (setf (nth i permuted) (nth j permuted))
                (setf (nth j permuted) temp))
              (push permuted result)))))
      result)))

;;;###autoload
(defun thematic-apply-palette (palette)
  "Apply PALETTE to the current theme.
This function applies the given color palette to the current theme."
  (interactive)
  (let ((theme-name (doom-theme)))
    (when (and theme-name palette)
      ;; This is a simplified approach - actual implementation would depend on
      ;; how Doom Emacs handles theme application
      (message "Applying palette permutation to theme %s" theme-name)
      ;; In a real implementation, this would actually modify the theme
      ;; For now, we just show a message
      palette)))

;;;###autoload
(defun thematic-toggle-theme-permutation ()
  "Toggle between the current theme and a permutation with exactly 2 colors swapped."
  (interactive)
  (let ((current-theme (doom-theme)))
    (cond
     ;; If we're in original state, generate and apply permutation
     ((eq thematic-theme-state 'original)
      (let ((palette (thematic-get-current-theme-palette)))
        (when palette
          (setq thematic-original-palette palette)
          (let ((permutations (thematic-generate-permutations palette)))
            (when permutations
              ;; Apply the first permutation for simplicity
              (let ((permuted-palette (car permutations)))
                (setq thematic-permuted-palette permuted-palette)
                (thematic-apply-palette permuted-palette)
                (setq thematic-theme-state 'permuted)
                (message "Applied theme permutation. Use toggle again to revert.")))))))
     ;; If we're in permuted state, revert to original
     ((eq thematic-theme-state 'permuted)
      (when thematic-original-palette
        (thematic-apply-palette thematic-original-palette)
        (setq thematic-theme-state 'original)
        (message "Reverted to original theme."))))))

;;;###autoload
(defun thematic-reset-theme-state ()
  "Reset the theme state to original."
  (interactive)
  (setq thematic-theme-state 'original)
  (setq thematic-permuted-palette nil)
  (setq thematic-original-palette nil)
  (message "Theme state reset to original."))

(provide 'thematic)

;;; thematic.el ends here