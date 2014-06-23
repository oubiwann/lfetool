(defmodule lfetool-cmd
  (export all))

(defun get-all-help ()
  (lfetool-plugin:get-loaded-plugin-modules))

(defun commands ()
  '"show list of commands + plugins here ... ")

(defun extract ()
  '"This version of lfetool isn't compressed.")

(defun help ()
  '"show some cool help here ... ")

(defun usage ()
  '"show usage here ... ")

(defun version ()
  (lfetool-util:get-version))

(defun get-commands ()
  '(commands extract help usage version))
