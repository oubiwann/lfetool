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
    (lfe_io:format "Error: ~p~n" (list error-data))))

(defun command-dispatch
  (((list))
   (non-plugin-dispatch 'usage))
  (((list command))
    (non-plugin-dispatch command))
  (((= (cons command _) args))
    (plugin-dispatch args)))

(defun non-plugin-dispatch (command)
 (try
  (call-cmd command)
  (catch
    ((tuple 'error error stacktrace)
     (lfe_io:format (++ "Command call error: ~p"
                        " (unknown command)~n"
                        "Stack trace:~n~p~n")
                    (list error stacktrace))))))

(defun plugin-dispatch
  (((list 'new plugin project-name))
   (try
    (call-new plugin project-name)
    (catch
      ((tuple 'error error stacktrace)
       (lfe_io:format (++ "Plugin call error: ~p"
                          " (unknown plugin or plugin function)~n"
                          "Stack trace:~n~p~n")
                      (list error stacktrace))))))
  ((args)
    (lfe_io:format "Error: unknown command(s): ~p~n" (list args)))
  )

(defun call-cmd (command)
  (lfe_io:format "~p~n" (list (call 'lfetool-cmd command))))

(defun call-new (plugin project-name)
  (let ((module (lfetool-plugin:get-plugin-module plugin)))
    (lfe_io:format "~p~n" (list (call module 'new project-name)))))
