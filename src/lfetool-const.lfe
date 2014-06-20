(defmodule lfetool-const
  (export all))

(defun cmd-sep ()
  "CLI command separator"
  " ")

(defun lfetool-home () '"~/.lfetool")
(defun plugin-src () '"./plugins/*/*.lfe")
(defun plugin-usr () (++ (lfetool-home) "/plugins"))
(defun plugin-usr-src () (++ (plugin-usr) "/*/*.lfe"))
(defun plugin-ebin () (++ (lfetool-home) "/ebin"))

(defun proj-patt () (binary "{{PROJECT}}"))
