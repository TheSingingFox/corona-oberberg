;;;; cl-corona-oberberg.lisp

(in-package #:cl-corona-oberberg)

(defparameter *corona-api-url* "https://api.corona-zahlen.org/districts/05374")

(defun get-data ()
  (json:decode-json-from-string (flexi-streams:octets-to-string (values (drakma:http-request *corona-api-url*)))))

(defun get-value (keys data)
  (cond ((null keys) data)
	((= 1 (length keys)) (cdr (assoc (car keys) data)))
	(t (get-value (cdr keys) (cdr (assoc (car keys) data))))))

(defun deaths ()
  (get-value '(:data :|05374| :deaths) (get-data)))

(defun landkreis ()
  (get-value '(:data :|05374| :name) (get-data)))
