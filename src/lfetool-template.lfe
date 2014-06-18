(defmodule lfetool-template
  (export all))

(defun get-template-file (plugin-name file-name)
  (++ (lfetool-util:get-cwd)
      "/plugins/" plugin-name
      "/templates/" file-name))

(defun load-template (plugin-name file-name)
  (element 2
    (file:read_file
      (get-template-file plugin-name file-name))))

(defun render-template (plugin-name file-name pattern)
  (binary:replace
    (load-template plugin-name file-name)
    (lfetool-const:proj-patt)
    (list_to_binary pattern)
    '(global)))

(defun write-rendered-template (plugin-name file-name pattern)
  "If no destination directory is provided, '<execution dir>/src' is assumed."
  (write-rendered-template
    plugin-name
    file-name
    pattern
    (++ (get-cwd) "/src")))

(defun write-rendered-template (plugin-name file-name pattern dest-dir)
  (file:write_file
    (++ dest-dir "/" (filename:basename file-name))
    (render-template plugin-name file-name pattern)))
