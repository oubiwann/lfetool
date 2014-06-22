(defmodule lfetool-cmd
  (export all))

(defun get-all-help ()
  (lfetool-plugin:get-loaded-plugin-modules))

(defun help ()
  '"show some cool help here ... ")

(defun usage ()
  '"show usage here ... ")

(defun commands ()
  '"show list of commands here ... ")

(defun version ()
  (lfetool-util:get-version))

