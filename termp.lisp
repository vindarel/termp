
;; Are we running inside a real terminal window? Unbound by default.
(defvar *termp*)

(defun termp (&key force)
  "Return T if we run on a terminal.
  This must fail on Slime (on Emacs' default shell prompt) and succeed on a Lisp in a terminal window."
  (if (and (not force)
           (boundp '*termp*))
      *termp*
      (setf *termp* (not (equalp "dumb" (uiop:getenv "TERM"))))))

(defun quit (&optional (status 0))
  "If we are in a real terminal, really quit. Otherwise, don't."
  (cond
    ((termp)
     (uiop:quit status))
    (t
     (log:info "termp: not on a terminal, not quitting with status ~a.~&" status))))
