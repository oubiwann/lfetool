(defmodule lfetool-tests-runner
  (export all))

(defun get-listener ()
  "Valid listeners include:
   * lfetool-tests-listener
   * eunit_progress
   * eunit_surefire"
  (list_to_atom
    (caar
      (element 2
        (lfetool-util:get-arg
          'listener
          "lfetool-tests-listener")))))

(defun run
  (('integration)
    (run-beams (ltest:get-integration-beams)))
  (('system)
    (run-beams (ltest:get-system-beams)))
  (('unit)
    (run-beams (ltest:get-unit-beams)))
  ((beam)
    (run-beam beam (get-listener))))

(defun run-module (module listener)
  ; (io:format "Running tests for ~s using listener '~s'~n"
  ;            (list module listener))
  (eunit:test `(,module)
              `(no_tty #(report #(,listener (colored))))))

(defun run-modules (modules)
  (run-modules modules (get-listener)))

(defun run-modules (modules listener)
  (eunit:test `(,@modules)
              `(no_tty #(report #(,listener (colored))))))

(defun run-beams (beams)
  (run-beams beams (get-listener)))

(defun run-beams (beams listener)
  (run-modules
    (lists:map #'lutil-file:beam->module/1 beams)
    listener))

(defun run-beam (beam)
  (run-beam beam (get-listener)))

(defun run-beam (beam listener)
  ; (io:format "Got beam '~p'~n" (list beam))
  (run-module (lutil-file:beam->module beam) listener))
