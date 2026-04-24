;; packages.el --- Package configuration for thematic

;; Copyright (C) 2026

;; Author: Alex Shroyer
;; Keywords: themes, emacs
;; Version: 0.1

;;; Commentary:

;; Package configuration for the thematic theme swapping package.

;;; Code:

(package! thematic
  :recipe (:host github :repo "alexshroyer/thematic"))

(provide 'thematic-packages)

;;; packages.el ends here