(defvar *cur-month* 11)
(defvar *po-num* 1)
(defvar *atc-name* nil)
(defvar *atc-list* nil)

(defun gen-atc-name ()
  (multiple-value-bind
	(second minute hour day month year day-of-week dst-p tz)
      (decode-universal-time (get-universal-time) -8)
    (unless (= *cur-month* month)
      (setf *cur-month* month)
      (setf *po-num* 0))
    (setf *atc-name* (concatenate 'string (write-to-string year) "-" (write-to-string month) "-po" (write-to-string *po-num*) ".html"))))

(defun make-atc-info (atc-title file-name)
  (list :atc-title atc-title :file-name file-name))

(defun add-to-list (atc-info)
  (push atc-info *atc-list*))

(defun save-list ()
  (with-open-file (out "/home/saigut/blogen/blog/list/atc-list"
		       :direction :output
		       :if-exists :supersede)
    (with-standard-io-syntax
      (print *atc-list* out))))

(defun load-list ()
  (with-open-file (in "/home/saigut/blogen/blog/list/atc-list")
    (with-standard-io-syntax
      (setf *atc-list* (read in)))))

(defun atc-list ()
  (html
    (:ol)))
