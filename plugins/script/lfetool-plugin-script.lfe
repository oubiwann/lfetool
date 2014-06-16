(defmodule lfetool-plugin-script
  (export all))

(defun get-name ()
  "script")

(defun get-short-help ()
  "")

(defun get-long-help ()
  (get-short-help))

(defun new (script-name)
  (tuple 'ok "successful call"
         'msg "pretending to create new script ..."
         'script-name script-name))

(defun get-parent-commands ()
  (tuple
    'new #'new/1))

(defun get-child-commands ()
  )

(defun get-arg-template ()
  )

