
(require "asdf")
(asdf:defsystem "termp"
  :version "0.1"
  :author "vindarel"
  :license "MIT"
  :components ((:file "termp"))

  :description "Check if we are in a dumb or real terminal. Provide the termp check and a quit function."
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.md"))
  ;; :in-order-to ((test-op (test-op "foo-test")))
  )
