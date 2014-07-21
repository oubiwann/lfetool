(defmodule lfetool-template
  (export all))

(defun get-template-file (plugin-name file-name)
  "Given a plugin name and a template file name, deduce and return the path
  to the file."
  (filename:join
    (list
      (lutil-file:get-cwd)
      "plugins"
      plugin-name
      "templates"
      file-name)))

(defun load-template (plugin-name file-name)
  "Given a plugin name and a template file name, deduce the path and return
  its binary contents."
  (element 2
    (file:read_file
      (get-template-file plugin-name file-name))))

(defun render-template (plugin-name file-name pattern)
  "Given a plugin name, a template file name, and a string pattern, deduce the
  path to the template and return its binary contents that have substituted
  the default place-holder with the string (list) value passed as the 'patern'
  parameter."
  (binary:replace
    (load-template plugin-name file-name)
    (lfetool-const:proj-patt)
    (list_to_binary pattern)
    '(global)))

(defun write-template (plugin-name file-name out-file)
  "Given a plugin name, a template file name, and an output file, deduce the
  path to the template and return its rendered binary contents.

  This version of the funciton doesn't take a substitution pattern; this is
  for files that do not have a template variable in them, but can be rendered
  as-is.

  This version of the function doesn't takve a destination directory argument
  and assumes it will be writing to './src'."
  (write-template
    plugin-name
    file-name
    ""
    out-file
    (++ (lutil-file:get-cwd) "/src")))

(defun write-template (plugin-name file-name pattern out-file)
  "Given a plugin name, a template file name, a substitution pattern, and an
  output file, deduce the path to the template and return its rendered binary
  contents that have substituted the default place-holder with the string
  (list) value passed as the 'patern' parameter.

  This version of the function doesn't takve a destination directory argument
  and assumes it will be writing to './src'."
  (write-template
    plugin-name
    file-name
    pattern
    out-file
    (++ (lutil-file:get-cwd) "/src")))

(defun write-template (plugin-name file-name pattern out-file dest-dir)
  "Given a plugin name, a template file name, a substitution pattern, an
  output file, and a destination directory, deduce the path to the template
  and return its rendered binary contents that have substituted the default
  place-holder with the string (list) value passed as the 'patern' parameter.
  Finally, write the results to the give file name in the given directory."
  (file:write_file
    (++ dest-dir "/" out-file)
    (render-template plugin-name file-name pattern)))
