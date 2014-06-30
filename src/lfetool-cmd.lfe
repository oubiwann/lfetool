(defmodule lfetool-cmd
  (export all))

(defun get-all-help ()
  (lfetool-plugin:get-loaded-plugin-modules))

(defun commands ()
  (lfetool-cmd-help:display-help))

(defun extract ()
  (io:format "~n~s~n~n"
             (list "This version of lfetool isn't compressed.")))

(defun help ()
  (lfetool-help:display-help))

(defun usage ()
  (lfetool-help:display-usage))

(defun version ()
  (lfetool-util:get-version))
