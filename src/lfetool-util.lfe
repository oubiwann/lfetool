(defmodule lfetool-util
  (export all))

(defun get-lfetool-version ()
  (lfe-utils:get-app-src-version "src/lfetool.app.src"))

(defun get-version ()
  (++ (lfe-utils:get-version)
      `(#(lfetool ,(get-lfetool-version)))))

(defun setup-dirs ()
  (list
    (filelib:ensure_dir
      (++ (lfe-utils:expand-home-dir
            (lfetool-const:plugin-usr))
          "/ignore"))
    (filelib:ensure_dir
      (++ (lfe-utils:expand-home-dir
            (lfetool-const:plugin-ebin))
          "/ignore"))))

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

(defun check-loaded-modules (substring)
  (lists:map
    (lambda (x)
      (case (re:run (atom_to_list (element 1 x)) (++ ".*" substring ".*"))
        ((tuple 'match _) x)
        (_ 'false)))
    (code:all_loaded)))

(defun filtered-loaded-modules (substring)
  (lists:filter
    (lambda (x) (=/= x 'false))
    (check-loaded-modules substring)))

(defun get-loaded-lfetool-modules ()
  (filtered-loaded-modules "lfetool"))

(defun display (arg)
  (lfe_io:format "~p~n" (list arg)))
