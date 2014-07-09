(defmodule lfetool-out
  (export all))

(defun black () '"\\033[0;30;40m")
(defun red () '"\\e[0;31;40m")
(defun green () '"\\033[0;32;40m")
(defun yellow () '"\\033[0;33;40m")
(defun blue () '"\\033[0;34;40m")
(defun magenta () '"\\033[0;35;40m")
(defun cyan () '"\\033[0;36;40m")
(defun white () '"\\033[0;37;40m")
(defun bold-black () '"\\033[1;30;40m")
(defun bold-red () '"\\033[1;31;40m")
(defun bold-green () '"\\033[1;32;40m")
(defun bold-yellow () '"\\033[1;33;40m")
(defun bold-blue () '"\\033[1;34;40m")
(defun bold-magenta () '"\\033[1;35;40m")
(defun bold-cyan () '"\\033[1;36;40m")
(defun bold-white () '"\\033[1;37;40m")
(defun end-color () '"\\e[m")

(defun display-str (arg color)
  (io:fwrite
    "~s~s~s~n"
    (list color arg (end-color))))

