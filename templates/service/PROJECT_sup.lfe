(defmodule {{PROJECT}}_sup
  (behaviour supervisor)
  ;; API
  (export (start_link 0))
  ;; Supervisor callbacks
  (export (init 1)))

(defun server-name ()
  '{{PROJECT}}_sup)

(defun module-name ()
  '{{PROJECT}}_sup)

(defun start_link ()
  (: supervisor start_link
    (tuple 'local (server-name)) (module-name) '()))

(defun init (args)
  (let* ((server (tuple
                   '{{PROJECT}}_server
                   (tuple '{{PROJECT}}_server 'start_link '())
                   'permanent
                   2000
                   'worker
                   (list '{{PROJECT}}_server)
                   ))
         (children (list server))
         (restart-strategy (tuple 'one_for_one 3 1)))
    (tuple 'ok (tuple restart-strategy children))))

