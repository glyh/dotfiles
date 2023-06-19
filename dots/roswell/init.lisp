(handler-case
 (multiple-value-bind
    (system-root-str _1 _2) (uiop:run-program '("git" "root") :output :string)
    (let* ((system-root (concatenate 'string (string-trim '(#\space #\newline) system-root-str) "/"))
           (system-name (first (last (pathname-directory system-root)))))
      (pushnew system-root ql:*local-project-directories*)
      (ql:register-local-projects)
      (ql:quickload system-name))) 
  (error (_)
    (format t "No system loaded")))

