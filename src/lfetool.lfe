(defmodule lfetool
  (export all))

(defun eval (cmd-string)
  (apply
    #'dispatch/1
    `(,(parse cmd-string))))

(defun tokenize (cmd-string)
  (string:tokens
    cmd-string
    (lfetool-const:cmd-sep)))

(defun get-plugin-module (name)
  (lfe-utils:atom-cat 'lfetool-plugin- name))

(defun parse (cmd-string)
  `#(ok ,(lists:map
           (lambda (x)
            (list_to_atom x))
           (tokenize cmd-string))))

(defun dispatch
  (((tuple 'ok (list 'new plugin arg)))
    (let ((module (get-plugin-module plugin)))
      (call module 'new arg)))
  (((tuple 'ok cmd-tokens))
    `#(ok ,cmd-tokens)))
