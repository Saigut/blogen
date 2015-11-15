(ql:quickload :aserve)

(asdf:operate 'asdf:load-op 'chapter-8)
(asdf:operate 'asdf:load-op 'chapter-31)

(defpackage :com.gigamonkeys.web
  (:use :cl :net.aserve :com.gigamonkeys.html))

(in-package :com.gigamonkeys.web)

(load "~/blogen/blog/s-article/atc-test.lisp")
(load "~/blogen/blog/s-list/article-list.lisp")
(gen-atc-name)
(with-open-file (out (concatenate 'string "/home/saigut/blogen/webroot/posts/" *atc-name*) :direction :output :if-exists :supersede)
  (with-html-output (out)
    (html
      (:html
	(:head
	 (:title *title*))
	(:body
	 (:div :id "article" (content)))))))
