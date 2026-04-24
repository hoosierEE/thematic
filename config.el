;;; config.el --- Configuration for thematic package

;; Copyright (C) 2026

;; Author: Alex Shroyer
;; Keywords: themes, emacs
;; Version: 0.1

;;; Commentary:

;; Configuration for the thematic theme swapping package.

;;; Code:

;; Add key bindings for thematic commands
(map! :leader
      :prefix "t"
      :desc "Toggle theme permutation" "p" #'thematic-toggle-theme
      :desc "Reset theme" "r" #'thematic-reset-theme
      :desc "Show theme state" "s" #'thematic-show-theme-state)

(provide 'thematic-config)

;;; config.el ends here