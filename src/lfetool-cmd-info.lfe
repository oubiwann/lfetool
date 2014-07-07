(defmodule lfetool-cmd-info
  (export all))

(defun bindir ()
  (lfetool-util:display-str
    (filename:join
      (list (filename:dirname (code:lib_dir)) "bin"))))

(defun get-erllibs ()
  (gb_sets:to_list
    (gb_sets:from_list
      (code:get_path))))

(defun erllibs ()
  (lfetool-util:display-str
    (let ((libs (get-erllibs)))
      (lists:foldl
        (lambda (x acc)
          (++ acc ":" (filename:dirname x)))
        (car libs)
        (cdr libs)))))

(defun installdir ()
  (lfetool-util:display-str
    (code:lib_dir)))

(defun path ()
  (lfetool-util:display-str
    (let ((libs (code:get_path)))
      (lists:foldl
        (lambda (x acc)
          (++ acc ":" (filename:join
                        (filename:dirname x) "bin")))
        (car libs)
        (cdr libs)))))

(defun plugins ()
  (lfetool-util:display
    (lists:map
      (lambda (x)
        `#(plugin ,x))
      (lfetool-plugin:get-loaded-plugin-names))))

(defun version ()
  (lfetool-cmd:version))
