(defmodule lfetool-cmd
  (export all))

(defun get-all-help ()
  (lfetool-util:display-str
    (lfetool-plugin:get-loaded-plugin-modules)))

(defun commands ()
  (lfetool-util:display-str
    (lfetool-cmd-help:display-help)))

(defun extract ()
  (lfetool-util:display-str
    "This version of lfetool isn't compressed."))

(defun help ()
  (lfetool-util:display-str
    (lfetool-help:display-help)))

(defun usage ()
  (lfetool-util:display-str
    (lfetool-help:display-usage)))

(defun version ()
  (lfetool-util:display
    (lfetool-util:get-version)))
