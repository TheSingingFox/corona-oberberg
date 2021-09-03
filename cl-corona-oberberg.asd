;;;; cl-corona-oberberg.asd

(asdf:defsystem #:cl-corona-oberberg
  :description "Describe cl-corona-oberberg here"
  :author "Silas Vedder"
  :license  "Specify license here"
  :version "0.0.1"
  :build-operation "program-op"
  :build-pathname "corona-oberberg"
  :entry-point "cl::main"
  :serial t
  :depends-on (#:drakma #:cl-json #:hunchentoot #:cl-who #:bordeaux-threads)
  :components ((:file "package")
	       (:file "utils")
	       (:file "data")
	       (:file "server")
               (:file "cl-corona-oberberg")))
