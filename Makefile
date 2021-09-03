all:
	sbcl --load cl-corona-oberberg.asd \
		--eval "(ql:quickload :cl-corona-oberberg)" \
		--eval "(asdf:make :cl-corona-oberberg)" \
		--eval "(quit)"

clean:
	rm corona-oberberg
