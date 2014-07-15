(defmodule lfetool-util
  (export all))

(defun get-lfetool-version ()
  (lutil:get-app-src-version "src/lfetool.app.src"))

(defun get-version ()
  (++ (lutil:get-version)
      `(#(lfetool ,(get-lfetool-version)))))

(defun setup-dirs ()
  (list
    ;; Make sure the user plugin directory exists.
    (filelib:ensure_dir
      (++ (lutil-file:expand-home-dir
            (lfetool-const:plugin-usr))
          "/ignore"))
    ;; Make sure the user plugin ebin directory exists.
    (filelib:ensure_dir
      (++ (lutil-file:expand-home-dir
            (lfetool-const:plugin-ebin))
          "/ignore"))
    ;; Make sure the eunit directory exists.
    (filelib:ensure_dir
      (++ (get-cwd)
          "/"
          (lfetool-const:eunit-ebin)
          "/ignore"))
    ;; Add the eunit ebin dir to ERL_LIBS
    (code:add_patha
      (lfetool-const:eunit-ebin))))

(defun get-cwd-arg ()
  "Return a default, if 'cwd' wasn't set as a flag when calling 'erl'."
  (let ((arg (init:get_argument 'cwd)))
    (case arg
      ('error
        #(default (("."))))
      (_ arg))))

(defun get-cwd ()
  "The current workding directory in this case is the directory that the user
  executed lfetool *from*. Shortly after it starts up, the lfetool script
  switches from this dir to the actual directory where the lfetool code/library
  lives. To preserve the original cwd, it is passed as a parameter to erl
  during start up. That value is accessed with this function."
  (caar
    (element 2 (get-cwd-arg))))

(defun get-execdir ()
  "The base directory is the lfetool source dir that was cloned during the
  boostrapping process. The lfetool script actually changes from the 'real'
  cwd to the lfetool bassedir when it executes.

  The cwd from the user's perspective is preserved by the lfetool script: it
  passes it as a parameter to erl. See get-cwd for more details."
  (element 2 (file:get_cwd)))

(defun get-loaded-lfetool-modules ()
  (lutil-file:filtered-loaded-modules "lfetool"))

(defun get-loaded-lfetool-beams ()
  (lutil-file:get-loaded-beams "lfetool"))

(defun display-str (arg)
  (lfe_io:format "~s~n" (list arg)))

(defun display (arg)
  (lfe_io:format "~p~n" (list arg)))

(defun display (msg args)
  (lfe_io:format msg (list args)))

(defun display (msg arg1 arg2)
  (lfe_io:format msg (list arg1 arg2)))

(defun get-debug-arg ()
  (let ((arg (init:get_argument 'debug)))
    (case arg
      ('error
        #(default ((false))))
      (_ arg))))

(defun get-debug ()
  (caar
    (element 2 (get-debug-arg))))

(defun debug? ()
  (if (== (get-debug) "true") 'true
      'false))

(defun display-stats ()
  (display-str "\n*** BEGIN DEBUG ***")
  (display-str "\nVersion Info:")
  (display (get-version))
  (display-str "\nCode Path Info:")
  (display (code:get_path))
  (display-str "\nSystem Environment Info:")
  (display-str (++ "ERL_LIBS: " (os:getenv "ERL_LIBS")))
  (display-str (++ "PATH :" (os:getenv "PATH")))
  (display-str "\nArgs Info:")
  (display (init:get_arguments))
  (display-str "\n*** END DEBUG ***\n"))

(defun join-list (elements)
  (string:join
    (lists:map
      (lambda (x)
        (atom_to_list x))
      elements)
    " "))
