;;;; package.lisp

(defpackage #:cl-corona-oberberg
  (:use #:cl #:cl-who))

(defpackage #:utils
  (:use #:cl)
  (:export #:precision-two
	   #:percentage))
