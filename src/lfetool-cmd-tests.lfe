(defmodule lfetool-cmd-tests
  (export all))

(defun all ()
  (unit)
  (integration)
  (system))

(defun integration ()
  'noop)

(defun system ()
  'noop)

(defun unit ()
  (io:format "This is the colour ~s.~nThis is the colour ~s.~n"
             (list (color:red "red") (color:blue "blue"))))

