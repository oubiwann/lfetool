(defmodule lfetool
  (export all))

(defun init ()
  (lfetool-plugin:load-plugins)
  (lfetool-util:setup-dirs))

(defun start ()
  (init))

(defun eval (cmd-string)
  (apply
    #'dispatch/1
    `(,(parse cmd-string))))

(defun tokenize (cmd-string)
  (string:tokens
    cmd-string
    (lfetool-const:cmd-sep)))

(defun parse (cmd-string)
  `#(ok ,(lists:map
           (lambda (x)
            (list_to_atom x))
           (tokenize cmd-string))))

(defun dispatch (data)
  (init)
  (-dispatch data))

(defun -dispatch
  ;; The first stage that lfetool does is parse command line parameters that
  ;; were passed to the bootstraper shell script. If there was a problem, we'll
  ;; see an #(error ...) tuple. If it goes okay, we continue to dispatch.
  (((tuple 'ok parsed-args))
    (command-dispatch parsed-args))
  (((tuple 'error error-data))
    (lfetool-err:display error-data)))

(defun command-dispatch
  (((list))
   (non-plugin-dispatch 'usage))
  (((list command))
    (non-plugin-dispatch command))
  (((= (cons command _) args))
    (plugin-dispatch args)))

(defun non-plugin-dispatch (command)
  ;; XXX check to see if the command is a known command, in which case, throw
  ;; a "missing plugin" error
  (try
    (call-cmd command)
    (catch
      ((= (tuple 'error _ _) error-data)
        (lfetool-err:display
          "Command call" "unknown command" error-data)))))

(defun plugin-dispatch
  (((list 'new plugin project-name))
   (try
    (call-new plugin project-name)
    (catch
    ((= (tuple 'error _ _) error-data)
     (lfetool-err:display
       "Plugin call" "unknown plugin or plugin function" error-data)))))
  ((args)
    (lfetool-err:display "unknown command and/or plugin: " args)))

(defun call-cmd (command)
  (lfetool-util:display (call 'lfetool-cmd command)))

(defun call-new (plugin project-name)
  (let ((module (lfetool-plugin:get-plugin-module plugin)))
    (lfetool-util:display (call module 'new project-name))))
