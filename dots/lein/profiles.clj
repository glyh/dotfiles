{:user 
  {:local-repo #=(eval (str (System/getenv "XDG_CACHE_HOME") "/m2"))
   :mirrors 
    {"clojars" {:name "Clojars TUNA" 
                :url "https://mirrors.tuna.tsinghua.edu.cn/clojars/"
                :repo-manager true}
     "central" {:name "Maven Aliyun"
                :url "https://maven.aliyun.com/repository/public"
                :repo-manager true}}}}
