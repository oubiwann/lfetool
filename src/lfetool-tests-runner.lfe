(defmodule lfetool-tests-runner
  (export all))

(defun run (module)
  (run module 'lfetool-tests-listener))
  ;(run module 'eunit_progress))
  ;(run module 'eunit_surefire))

(defun run (module listener)
  (io:format "Running tests for ~s using listener '~s'~n"
             (list module listener))
  (eunit:test `(,module)
              `(no_tty #(report #(,listener (colored))))))
