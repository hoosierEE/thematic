;;; thematic-pkg.el --- Package definition for thematic

;; Copyright (C) 2026

;; Author: Alex Shroyer
;; Keywords: themes, emacs
;; Version: 0.1
;; URL: https://github.com/alexshroyer/thematic

;;; Package-Requires: ((emacs "26.1") (cl-lib "0.5") (dash "2.18"))

;;; Commentary:

;; Package definition for the thematic theme swapping package.

;;; Code:

(define-package "thematic"
  "0.1"
  "Theme swapping interface for Doom Emacs"
  '((emacs "26.1")
    (cl-lib "0.5")
    (dash "2.18"))
  :keywords '("themes" "emacs")
  :url "https://github.com/alexshroyer/thematic")

;;; thematic-pkg.el ends here