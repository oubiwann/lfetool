(defmodule lfetool-const
  (export all))

(defun cmd-sep ()
  "CLI command separator"
  " ")

(defun plugin-src () '"./plugins/*/*.lfe")
(defun plugin-usr () '"~/.lfetool/plugins")
(defun plugin-usr-src () (++ (plugin-usr) "/*/*.lfe"))
(defun plugin-ebin () '"~/.lfetool/ebin")
