(defmodule lfetool-plugin-script
  (export all))

(defun get-name ()
  "script")

(defun get-short-help ()
  "")

(defun get-long-help ()
  (get-short-help))

(defun new (script-name)
  (tuple 'ok "here's the script"))

(defun get-parent-commands ()
  (tuple
    'new #'new/1))

(defun get-child-commands ()
  )

(defun get-arg-template ()
  )

