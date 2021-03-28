;;;; cl-corona-oberberg.asd

(asdf:defsystem #:cl-corona-oberberg
  :description "Describe cl-corona-oberberg here"
  :author "Silas Vedder"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:drakma #:cl-json #:hunchentoot #:cl-who)
  :components ((:file "package")
	       (:file "utils")
	       (:file "data")
	       (:file "server")
               (:file "cl-corona-oberberg")))
