;;;; utils.lisp

(in-package #:utils)

(defun precision-two (num)
  (float (/ (round (* num 100)) 100)))

(defun percentage (&key of per)
  (* (float (/ of per)) 100))
