;;;; This module serves a dual purpose:
;;;;   * providing functions for lfetool commands help, and
;;;;   * defining a behaviour -- 'lfetool-cmd-help' -- to be used by plugin
;;;;     implementations which generate.
;;;;
(defmodule lfetool-cmd-help
  (export all))

(include-file "include/plugin-data.lfe")

;;; The following defines the lfetool-cmd-help behaviour. It should be used
;;; by all lfetool plugins which want to provide a help message for custom
;;; top-level commands.
;;;
;;; Example usage for ~/.lfetool/plugins/my-thing/lfetool-plugin-my-thing.lfe:
;;;
;;;  (defmodule lfetool-plugin-my-thing
;;;    (behaviour lfetool-plugin)
;;;    (behaviour lfetool-cmd-help)
;;;    (export all))
;;;
;;;  (def get-commands-help () ...)
;;;
;;;  (def get-commands-help (command) ...)
;;;
;;; Note that LFE currently doesn't add any checks for missing functions when
;;; compiling modules implementing behaviours. For now, writing lfetool plugins
;;; using standard a behaviour accomplishes two things: 1) practicing good
;;; programming etiquitte, and 2) future-proofing for when the LFE compiler does
;;; support it.
;;;
;;; The authors of lfetool accomplish one primary thing by providing the
;;; behaviour and encouraging developers to use it: codification of plugin
;;; development.
;;;
(defun behaviour_info
  (('callbacks)
    '(
      #(get-commands-help 0)
      #(get-commands-help 1)))
  ((_)
   'undefined))

(defun get-commands-help ()
  `(#(commands "List all the top-level commands available to lfetool.")
    #(extract ,(++ "lfetool is no longer compressed; this is a no-op "
                   "(included for backwards compatibility only)."))
    #(help ,(++ "Get the general help for lfetool; if passed a plugin "
                "name as an argument, display the help for that plugin."))
    #(info "Get information of the type indicated by the passed argument.")
    #(install ,(++ "Install LFE by default; if passed an argument, in "
                   "stall the indicated software."))
    #(repl ,(++ "By default, start an LFE REPL with access to all the "
                "dependency modules; if passed an argument, start a REPL "
                "of that particular type."))
    #(new "Create new LFE projects with related files pre-populated with code.")
    #(tests "Perform the tests-related action for the given argument.")
    #(update "Update the system/software associated with the given argument.")
    #(usage "Get lfetool usage.")
    #(version "Get the current version of lfetool and associated systems.")))

(defun get-commands-help (command)
  (proplists:get_value command (get-commands-help)))

(defun get-user-commands-help ()
  (lists:merge
    (lists:map
      (lambda (x)
        (call x 'get-commands-help))
      (lfetool-plugin:get-loaded-cmd-help-modules))))

(defun get-command-lengths (help-commands)
  (lists:map
    (match-lambda (((tuple cmd _))
      (length (atom_to_list cmd))))
    help-commands))

(defun get-longest-command-length (help-commands)
  (lists:max (get-command-lengths help-commands)))

(defun wrap-help (pad-len wrap-width help)
  (let* ((text (lutil-text:wrap-text help wrap-width))
         ((cons first-line rest) (string:tokens text "\n")))
    (lists:foldl
      (lambda (x acc)
        (++ acc "\n" (string:copies " " pad-len) x))
      first-line
      rest)))

(defun format-help
  (((tuple cmd help) sep max-len max-pad wrap-width)
    (io_lib:format (++ "~-" (integer_to_list max-len) "s" "~s~s~n")
               (list cmd sep (wrap-help max-pad wrap-width help)))))

(defun format-help (help)
  (let* ((max-len (get-longest-command-length help))
         (sep (lfetool-const:command-help-sep))
         (max-pad (+ max-len (length sep)))
         (wrap-width (- (lfetool-const:command-help-wid) max-pad)))
    (lists:map
      (lambda (x)
        (format-help x sep max-len max-pad wrap-width))
      help)))

(defun format-builtin-help ()
  (io:format "~nHelp for lfetool built-in top-level commands:~n~n")
  (format-help (get-commands-help)))

(defun format-user-help ()
  (let ((help (get-user-commands-help)))
    (cond
      ((> (length help) 0)
        (++ "\n\nUser-provided top-level commands:\n\n"
            (format-help help)
            "\n"))
      ('true
        (++ "\n")))))

(defun display-help ()
  (++ (format-builtin-help)
      (format-user-help)))
