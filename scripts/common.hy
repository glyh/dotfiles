(defmacro ! [#* args]
  `(do
     (import subprocess)
     (try
      (.check_returncode 
       (subprocess.run 
         ~(list (map 
                  (fn [arg]
                    (str (if (isinstance arg hy.models.Expression)
                           (hy.eval arg)
                           arg)))
                  args))))
      True ;; Return True if success
      (except []
        False))))
      
