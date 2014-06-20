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

(defun parse (cmd-string)
  `#(ok ,(lists:map
           (lambda (x)
            (list_to_atom x))
           (tokenize cmd-string))))

(defun old-dispatch
  (((tuple 'ok (list 'new plugin arg)))
  ;; Match any 'new' command from the command line.
    (let ((module (lfetool-plugin:get-plugin-module plugin)))
      (lfe_io:format "~p~n" (list (call module 'new arg)))))
  (((tuple 'ok cmd-tokens))
  ;; Handle the case when there is no particular match.
    `#(ok ,cmd-tokens)))

(defun dispatch (data)
  (lfetool-plugin:load-plugins)
  (-dispatch data))

(defun -dispatch
  ;; The first stage that lfetool does is parse command line parameters that
  ;; were passed to the bootstraper shell script. If there was a problem, we'll
  ;; see an #(error ...) tuple. If it goes okay, we continue to dispatch.
  (((tuple 'ok parsed-args))
    (command-dispatch parsed-args))
  (((tuple 'error error-data))
    (lfe_io:format "Error: ~p~n" (list error-data))))

(defun command-dispatch
  (((list command))
    (non-plugin-dispatch command))
  (((= (cons command _) args))
    (plugin-dispatch args)))

(defun non-plugin-dispatch (command)
  ;; XXX write an actual implementation!
  (case command
    ('help
      (io:format "(show some cool help here ... )~n"))
    (_
      (io:format "Error: unknown command/plugin~n"))
    ))

(defun plugin-dispatch
  (((list 'new plugin project-name))
    (call-new plugin project-name))
  )

(defun call-new (plugin project-name)
  (let ((module (lfetool-plugin:get-plugin-module plugin)))
    (lfe_io:format "~p~n" (list (call module 'new project-name)))))
