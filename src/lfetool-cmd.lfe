(defmodule lfetool-cmd
  (export all))

(defun get-all-help ()
  (lfetool-plugin:get-loaded-plugin-modules))
