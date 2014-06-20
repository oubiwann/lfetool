(defmodule lfetool-plugin-script
  (export all))

(defun get-name ()
  'script)

(defun get-short-help ()
  "Create a script that will be executed from the CLI by lfescript.")

(defun get-long-help ()
  (get-short-help))

(defun new (script-name)
  `#(ok
     #(msg "pretending to create new script ...")
     #(script-name ,script-name)
     #(location ,(lfetool-util:get-basedir))
     #(cwd ,(lfetool-util:get-cwd))))

(defun commands ()
  "A list of atoms that represent the top-level commands supported by this
  plugin. For instance, if (lfetool-plugin-foo:commands) returns
  '(new info), then this plugin should handle the following uses form the CLI:

  $ lfetool new foo
  $ lfetool info foo
  "
  '(new))

(defun get-child-commands ()
  )

(defun get-arg-template ()
  )

