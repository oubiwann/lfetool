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
(defun plugin-beams () (++ (plugin-ebin) "/*.beam"))

(defun plugin-module-prefix () '"lfetool-plugin-")

(defun proj-patt () (binary "{{PROJECT}}"))
