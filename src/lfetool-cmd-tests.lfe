(defmodule lfetool-cmd-tests
  (export all))

(defun allstuff ()
  (io:format "This is the ~s color~n" (list (color:red "red"))))

(defun integration ()
  'noop)

(defun system ()
  'noop)

(defun unit ()
  'noop)
