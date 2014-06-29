(defmodule lfetool-registry
  (export all))

(include-file "include/plugin-data.lfe")

(defun start (plugins)
  ; XXX call to functions that scan plugins, populate registry, etc.
  (listen plugins))

(defun listen (plugins)
  "This function starts up a process that loops, holding the passed data and
  providing access to it.

  The 'plugins' data passed is a record which has a list of plugins."
  (receive
    ((list caller 'register plugin-type plugin-data)
      ; XXX add call to registration function
      ; XXX update plugins variable
      (! caller `#(ok #(registered #(plugin-type ,plugin-type))))
      (listen plugins))
    ((list caller plugin-type)
      ; XXX add call to plugin search function
      (! caller #(module some-module))
      (listen plugins))
    ((cons caller _)
      (! caller #(error operation-not-supported))
      (listen plugins))
    ))

(defun query (args)
  (let* ((reg-pid (whereis (lfetool-const:plugin-registry-name))))
    ; XXX check result
    ; XXX if result matches #(module ...), call function in module
    (! reg-pid (++ `(,(self)) args))
    (receive
      (result
        (lfe_io:format "Got result: ~p~n" (list result))))
    ))
