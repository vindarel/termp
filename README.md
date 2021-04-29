
Are we running inside a real or a dumb terminal window?

Adapt your logic for the terminal or for Slime.

A small utility that I use in [progressons](https://github.com/vindarel/progressons) and that I ~~might~~ re-use.


~~~lisp
(defvar *termp*) ;  Unbound by default.

(defun termp (&key force)
  "Return T if we run on a terminal.
  This must fail on Slime (on Emacs' default shell prompt) and succeed on a Lisp in a terminal window."
  (if (and (not force)
           (boundp '*termp*))
      *termp*
      (setf *termp* (not (equalp "dumb" (uiop:getenv "TERM"))))))
~~~

There is also `termp:quit &optional code`: quit the Lisp image (`uiop:quit`) only if we are in a non-dumb terminal. Helps to test scripts.

---

WTFPL
