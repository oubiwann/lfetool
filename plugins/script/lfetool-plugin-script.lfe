(defmodule lfetool-plugin-script
  (behaviour lfetool-plugin)
  (export all))

(defun get-name ()
  'script)

(defun get-description ()
  '"Create a script that will be executed from the CLI by lfescript.")

(defun get-help ()
  '"<no help provided>")

(defun new (script-name)
  (let* ((script-name (atom_to_list script-name))
         (dest-dir ".")
         (full-path (++ dest-dir "/" script-name)))
    (lfetool-template:write-template
      'script
      "SCRIPT.tmpl"
      ""
      script-name
      dest-dir)
    (file:change_mode full-path #8r755)
    (lfetool-util:display-str (++ "Created script '" full-path "'."))))

  ; `#(ok
  ;    #(msg "pretending to create new script ...")
  ;    #(script-name ,script-name)
  ;    #(exec-dir ,(lfetool-util:get-execdir))
  ;    #(cwd ,(lfetool-util:get-cwd))))

(defun get-commands ()
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

