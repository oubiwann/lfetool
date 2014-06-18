(defmodule lfetool-plugin-script
  (export all))

(defun get-name ()
  "script")

(defun get-short-help ()
  "")

(defun get-long-help ()
  (get-short-help))

(defun new (script-name)
  `#(ok
     #(msg "pretending to create new script ...")
     #(script-name ,script-name)
     #(location ,(lfetool-util:get-basedir))
     #(cwd ,(lfetool-util:get-cwd))))

(defun get-parent-commands ()
  (tuple
    'new #'new/1))

(defun get-child-commands ()
  )

(defun get-arg-template ()
  )

