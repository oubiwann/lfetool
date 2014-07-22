(defmodule lfetool-cmd-build
  (export all))

(defun src ()
  (lfe_io:format "Building ./src files ... ~n\t~p~n"
                 (list (lutil-file:compile-src))))

(defun test ()
  (lfe_io:format "Building ./test files ... ~n\t~p~n"
                 (list (lutil-file:compile-test))))

(defun deps ()
  (lfe_io:format "Building dependencies ... ~n\t~p~n"
                 (list (lutil-file:compile-deps))))

(defun all ()
  (deps)
  (src)
  (test))
