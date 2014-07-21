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
        (lutil-file:get-arg
          'listener
          "lfetool-tests-listener")))))

(defun get-default-options (listener)
  `(no_tty #(report #(,listener (colored)))))

(defun run
  (('integration)
    (run-beams (ltest:get-integration-beams (lutil-file:get-cwd))))
  (('system)
    (run-beams (ltest:get-system-beams (lutil-file:get-cwd))))
  (('unit)
    (run-beams (ltest:get-unit-beams (lutil-file:get-cwd))))
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
  (io:format "Got modules '~p' ...~n" (list modules))
  (eunit:test modules (get-default-options listener)))

(defun run-beams (beams)
  (run-beams beams (get-listener)))

(defun run-beams (beams listener)
  (io:format "Got beams '~p' ...~n" (list beams))
  (eunit:test (lutil-file:beams->files beams)
              (get-default-options listener)))

(defun run-beam (beam)
  (run-beam beam (get-listener)))

(defun run-beam (beam listener)
  (io:format "Got beam '~p' ...~n" (list beam))
  (run-module (lutil-file:beam->module beam) listener))
