;; Vlime debug
(load "~/.local/share/nvim/site/pack/packer/opt/vlime/lisp/load-vlime.lisp")
(ql:quickload "cffi")
(ql:quickload "chipz")
(swank-loader:init :load-contribs t)
(vlime:main :port 7002 :start-swank nil :swank-port 4006)
