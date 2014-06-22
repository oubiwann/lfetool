(defmodule lfetool-err
  (export all))

(defun error-msg ()
  (++ "Error: ~p~n"))

(defun error-msg (description)
  (++ "Error: " description "~p~n"))

(defun error-msg (description comment)
  (++ description " error: ~p (" comment ")~nStack trace:~n~p~n"))

(defun display (data)
  (lfetool-util:display (error-msg) data))

(defun display (description data)
  (lfetool-util:display
    (error-msg description)
    data))

(defun display
  ((description comment (tuple 'error error stacktrace))
    (lfetool-util:display
      (error-msg description comment)
      error
      stacktrace)))
