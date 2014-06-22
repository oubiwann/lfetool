(defmodule lfetool-inspect
  (export all))

(defun command? (module command)
  "Check to see if a given command is supported by a plugin."
  (lists:member command (call module 'get-commands)))

(defun all-plugin-commands ()
  (lists:usort
    (lists:merge
      (lists:map
        (lambda (x)
          (call x 'get-commands))
        (lfetool-plugin:get-loaded-plugin-modules)))))
