;;;; cl-corona-oberberg.asd

(asdf:defsystem #:cl-corona-oberberg
  :description "Describe cl-corona-oberberg here"
  :author "Silas Vedder"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:drakma)
  :components ((:file "package")
               (:file "cl-corona-oberberg")))
