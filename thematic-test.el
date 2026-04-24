;;; thematic-test.el --- Tests for thematic theme swapping

;; Copyright (C) 2026

;; Author: Alex Shroyer
;; Keywords: themes, emacs, test
;; Version: 0.1

;;; Commentary:

;; Tests for the thematic theme swapping package.

;;; Code:

(require 'ert)
(require 'thematic)

(ert-deftest thematic-test-permutation-generation ()
  "Test that permutation generation works correctly."
  (let ((test-palette '(("keyword" . "#ff00ff")
                       ("function" . "#00ffff")
                       ("comment" . "#111111"))))
    (should (equal (thematic-generate-permutations test-palette)
                   '((("comment" . "#111111") ("function" . "#00ffff") ("keyword" . "#ff00ff"))
                     (("function" . "#00ffff") ("comment" . "#111111") ("keyword" . "#ff00ff"))
                     (("function" . "#00ffff") ("keyword" . "#ff00ff") ("comment" . "#111111")))))))

(ert-deftest thematic-test-empty-palette ()
  "Test permutation generation with empty palette."
  (should (equal (thematic-generate-permutations '()) '())))

(ert-deftest thematic-test-single-item ()
  "Test permutation generation with single item."
  (should (equal (thematic-generate-permutations '(("item" . "#ffffff"))) '())))

(provide 'thematic-test)

;;; thematic-test.el ends here