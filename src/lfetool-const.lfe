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

(defun plugin-behaviour () 'lfetool-plugin)
(defun cmd-help-behaviour () 'lfetool-cmd-help)
(defun plugin-module-prefix () (++ (atom_to_list (plugin-behaviour)) "-"))

(defun proj-patt () (binary "{{PROJECT}}"))
(defun null-patt () (binary ""))

(defun non-plugin-commands () '(commands extract help usage version))
(defun plugin-commands () '(new))
(defun command-help-sep () '" - ")
(defun command-help-wid () 72)

(defun plugin-registry-name () 'plugin-registry)
