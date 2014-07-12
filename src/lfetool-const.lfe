(defmodule lfetool-const
  (export all))

; XXX this should go in the app.src config
(defun cmd-sep ()
  "CLI command separator"
  " ")

;; XXX create a ticket for using app.src as a config source of truth:
;; * move basic config options out of here and into there
;; * update the function names here to return the data stored in app.src
;; * add some utility functions to easily extract config options from app.src

(defun lfetool-home () '"~/.lfetool") ; XXX this should go in the app.src config
(defun plugin-src () '"./plugins/*/*.lfe")
(defun plugin-usr () (++ (lfetool-home) "/plugins"))
(defun plugin-usr-src () (++ (plugin-usr) "/*/*.lfe"))
(defun plugin-ebin () (++ (lfetool-home) "/ebin"))
(defun plugin-beams () (++ (plugin-ebin) "/*.beam"))

(defun eunit-ebin () '".eunit") ; XXX this should go in the app.src config

(defun plugin-behaviour () 'lfetool-plugin)
(defun cmd-help-behaviour () 'lfetool-cmd-help)
(defun plugin-module-prefix () (++ (atom_to_list (plugin-behaviour)) "-"))

(defun proj-patt () (binary "{{PROJECT}}"))
(defun null-patt () (binary ""))

(defun non-plugin-commands () '(commands extract help usage version))
(defun plugin-commands () '(new))
(defun command-help-sep () '" - ") ; XXX this should go in the app.src config
(defun command-help-wid () 72) ; XXX this should go in the app.src config

(defun plugin-registry-name () 'plugin-registry) ; XXX this should go in the app.src config

(defun test-suite-header () '"=")
(defun test-suite-subheader () '"-")
(defun test-suite-title () '"lunit")
(defun test-suite-width () 72)
