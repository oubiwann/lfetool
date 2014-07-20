(defmodule lfetool-cmd-tests
  (export all))

(defun test-suite-header ()
  (test-header (lfetool-const:test-suite-title)
               (lfetool-const:test-suite-header)))

(defun test-suite-footer ()
  (io:format "~s~n~n"
             (list
               (string:copies
                 (lfetool-const:test-suite-header)
                 (lfetool-const:test-suite-width)))))

(defun test-type-header (title)
  (test-header title (lfetool-const:test-suite-subheader)))

(defun test-header (title char)
  (let* ((title (++ " " title " "))
         (header-len (trunc
                     (/
                       (- (lfetool-const:test-suite-width) (length title))
                       2))))
    (io:format "~s~n~n" (list
                      (++ (string:copies char header-len)
                          title
                          (string:copies char header-len))))))

(defun all ()
  (test-suite-header)
  (unit 'combined)
  (integration 'combined)
  (system 'combined)
  (test-suite-footer))

(defun integration (_)
  (test-type-header "Integration Tests")
  (lfetool-tests-runner:run 'integration))

(defun integration ()
  (test-suite-header)
  (integration 'solo)
  (test-suite-footer))

(defun system (_)
  (test-type-header "System Tests")
  (lfetool-tests-runner:run 'system))

(defun system ()
  (test-suite-header)
  (system 'solo)
  (test-suite-footer))

(defun unit (_)
  (test-type-header "Unit Tests")
  (lfetool-tests-runner:run 'unit))

(defun unit ()
  (test-suite-header)
  (unit 'solo)
  (test-suite-footer))
