;;;; data.lisp

(in-package #:cl-corona-oberberg)

(defparameter *corona-api-url* "http://silasvedder.xyz:8080/districts/05374")

(defun get-data ()
  (json:decode-json-from-string (flexi-streams:octets-to-string (values (drakma:http-request *corona-api-url*)))))

(defun get-value (keys data)
  (cond ((null keys) data)
	((= 1 (length keys)) (cdr (assoc (car keys) data)))
	(t (get-value (cdr keys) (cdr (assoc (car keys) data))))))

(defun oberberg (keys)
  (get-value keys (get-value '(:data :|05374|) (get-data))))

(defun deaths ()
  (oberberg '(:deaths)))

(defun deaths-week ()
  (oberberg '(:deaths-per-week)))

(defun deaths-yesterday ()
  (oberberg '(:delta :deaths)))

(defun cases ()
  (oberberg '(:cases)))

(defun cases-week ()
  (oberberg '(:cases-per-week)))

(defun cases-yesterday ()
  (oberberg '(:delta :cases)))

(defun incidence ()
  (utils:precision-two (oberberg '(:week-incidence))))

(defun population ()
  (oberberg '(:population)))
