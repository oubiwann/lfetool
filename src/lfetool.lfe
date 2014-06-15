(defmodule lfetool
  (export all))

(defun eval (cmd-string)
  (apply
    #'dispatch/1
    `(,(parse cmd-string))))

(defun parse (cmd-string)
  `#(ok ,(string:tokens
           cmd-string
           (lfetool-const:cmd-sep))))

(defun dispatch
  (((tuple 'ok cmd-tokens))
    `#(ok ,cmd-tokens)))
