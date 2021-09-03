;;;; cl-corona-oberberg.lisp

(in-package #:cl)

(defun main ()
  (let ((cmd (uiop:command-line-arguments)))
    (cl-corona-oberberg:start-server (if cmd (parse-integer (car cmd)) 80)))
  (handler-case (bt:join-thread (find-if (lambda (th)
                                           (search "hunchentoot" (bt:thread-name th)))
                                         (bt:all-threads)))
    (#+sbcl sb-sys:interactive-interrupt
     #+ccl  ccl:interrupt-signal-condition
     #+clisp system::simple-interrupt-condition
     #+ecl ext:interactive-interrupt
     #+allegro excl:interrupt-signal
     () (progn
          (format *error-output* "Aborting.~&")
          (cl-corona-oberberg:stop-server)
          (uiop:quit)))
    (error (c) (format t "Woops, an unknown error occured:~&~a~&" c))))
