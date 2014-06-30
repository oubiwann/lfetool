(defmodule lfetool-help
  (export all))

(defun display-help ()
  (io:format "~n~s~n~n"
             (list "show some cool help here ... ")))

(defun display-usage ()
  (io:format "~n~s~n~n"
             (list "show usage here ... ")))
