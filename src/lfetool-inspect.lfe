(defmodule lfetool-inspect
  (export all))

(defun command? (command)
  "Check to see if a giaven command is defined by any plugin."
  (lists:member command (all-plugin-commands)))

(defun command? (module command)
  "Check to see if a given command is supported by a plugin."
  (lists:member command (call module 'get-commands)))

(defun not-command? (command)
  (not (command? command)))

(defun not-command? (module command)
  (not (command? module command)))

(defun all-plugin-commands ()
  (lists:usort
    (lists:merge
      (lists:map
        (lambda (x)
          (call x 'get-commands))
        (lfetool-plugin:get-loaded-plugin-modules)))))

(defun plugin? (plugin-name)
  (lists:member
    plugin-name
    (lfetool-plugin:get-loaded-plugin-names)))

(defun not-plugin? (plugin-name)
  (not (plugin? plugin-name)))
