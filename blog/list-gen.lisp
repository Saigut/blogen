(ql:quickload :aserve)

(asdf:operate 'asdf:load-op 'chapter-8)
(asdf:operate 'asdf:load-op 'chapter-31)

(defpackage :com.gigamonkeys.web
  (:use :cl :net.aserve :com.gigamonkeys.html))

(in-package :com.gigamonkeys.web)
