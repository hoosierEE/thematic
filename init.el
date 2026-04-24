;;; init.el --- Init file for thematic package

;; Copyright (C) 2026

;; Author: Alex Shroyer
;; Keywords: themes, emacs
;; Version: 0.1

;;; Commentary:

;; Init file for the thematic theme swapping package.

;;; Code:

;; Load the main package
(load-file "thematic.el")

;; Load the commands
(load-file "thematic-commands.el")

;; Provide the package
(provide 'thematic-init)

;;; init.el ends here