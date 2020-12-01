
;; Are we running inside a real terminal window? Unbound by default.
(defvar *termp*)

(defun termp (&key force)
  "Return T if we run on a terminal.
  This must fail on Slime (on Emacs' default shell prompt) and succeed on a Lisp in a terminal window."
  (if (and (not force)
           (boundp '*termp*))
      *termp*
      (setf *termp* (not (equalp "dumb" (uiop:getenv "TERM"))))))
