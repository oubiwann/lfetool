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

(defun get-plugins ()
  (lists:merge
    (filelib:wildcard
      (lfetool-const:plugin-src))
    (filelib:wildcard
      (lfe-utils:expand-home-dir
        (lfetool-const:plugin-usr-src)))))

(defun compile-plugins ()
  (compile-plugins
    (lfe-utils:expand-home-dir
      (lfetool-const:plugin-ebin))))

(defun compile-plugins
  (('show-output)
    (io:format "~p~n" (list (compile-plugins))))
  ((out-dir)
    (setup-dirs)
    (lfe-utils:compile
      (get-plugins)
      (lfe-utils:get-deps)
      out-dir)))
