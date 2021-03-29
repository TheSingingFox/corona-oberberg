;;;; server.lisp

(in-package #:cl-corona-oberberg)

(defvar *acceptor* nil)

(defun stop-server ()
  (when *acceptor*
    (hunchentoot:stop *acceptor*))
  (setf *acceptor* nil))


(defun start-server (port)
  (stop-server)
  (hunchentoot:start (setf *acceptor*
			   (make-instance 'hunchentoot:easy-acceptor :port port))))

(push (hunchentoot:create-static-file-dispatcher-and-handler
       "/style.css" #P"~/quicklisp/local-projects/corona-oberberg/style.css")
      hunchentoot:*dispatch-table*)

(hunchentoot:define-easy-handler (main :uri "/corona/") ()
  (setf (hunchentoot:content-type*) "text/html")
  (homepage))

(defmacro with-page ((&key title) &body body)
  `(with-html-output-to-string
       (*standard-output* nil :prologue t :indent t)
     (:html
      (:head
       (:title ,title)
       (:link :type "text/css" :rel "stylesheet" :href "/style.css"))
      (:body ,@body))))


(defun alist->html-table (alist)
  (with-html-output-to-string (*standard-output* nil :prologue nil :indent t)
    (:table
     (loop for i in alist
	   do (htm
	       (:tr
		(:td (fmt "~A" (car i)))
		(:td (fmt "~A" (cdr i)))))))))

(defun homepage ()
  (let ((title "Corona im Oberbergischen Kreis" )
	(deaths (deaths))
	(deaths-week (deaths-week))
	(deaths-yesterday (deaths-yesterday))
	(cases (cases))
	(cases-week (cases-week))
	(cases-yesterday (cases-yesterday))
	(population (population))
	(incidence (incidence)))
    (with-page (:title title)
      (htm (:h1 (fmt "~A" title))
	   (:h2 "Absolute Zahlen")
	   (fmt "~A" (alist->html-table
		      `(("Tode seit Beginn der Pandemie" . ,deaths)
			("Coronafälle seit Beginn der Pandemie" . ,cases)
			("Tode der letzten Woche (ausgenommen heute)" . ,deaths-week)
			("Coronafälle der letzten Woche (ausgenommen heute)" . ,cases-week)
			("Tode seit gestern" . ,deaths-yesterday)
			("Coronafälle seit gestern" . ,cases-yesterday)
			("Einwohner des Oberbergischen Kreises" . ,population))))
	   (:h2 "Relative Verhältnisse")
	   (fmt "~A" (alist->html-table
		      `(("Tode pro 100 Einwohner" . ,(utils:precision-two
						      (utils:percentage :of deaths
									:per population)))
			("Coronafälle pro 100 Einwohner" . ,(utils:precision-two
							     (utils:percentage :of cases
									       :per population)))
			("7-Tages-Inzidenz" . ,incidence))))))))
