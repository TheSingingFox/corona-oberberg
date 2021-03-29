# corona-oberberg
RKI Statistiken für den Oberbergischen Kreis aufbereitet.

Nutzt die Daten der [RKI-API](https://api.corona-zahlen.org/).

## Installation

```
$ cd ~/quicklisp/local-projects
$ git clone https://github.com/TheSingingFox/corona-oberberg.git
```

Und dann in Common Lisp:

```
* (ql:quickload :cl-corona-oberberg)
* (cl-corona-oberberg:start-server 8080)
```

Dann kann man im Browser bei `localhost:8080` die Daten sehen.

Der Server lässt sich mit `(cl-corona-oberberg:stop-server)` stoppen.
