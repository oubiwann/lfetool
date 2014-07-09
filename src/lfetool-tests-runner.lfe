(defmodule lfetool-tests-runner
  (export all))

(defun run (module)
  (run module 'lfetool-tests-listener))

(defun run (module listener)
  ;(eunit:test module `(#(report ,listener))))
  (io:format "Running tests for ~s using listener '~s'~n"
             (list module listener)))
