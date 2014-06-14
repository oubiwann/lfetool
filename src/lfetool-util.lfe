(defmodule lfetool-util
  (export all))

(defun get-lfetool-version ()
  (lfe-utils:get-app-src-version "src/lfetool.app.src"))

(defun get-version ()
  (++ (lfe-utils:get-version)
      `(#(lfetool ,(get-lfetool-version)))))
