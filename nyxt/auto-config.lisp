(DEFINE-CONFIGURATION BUFFER
  ((DEFAULT-MODES (APPEND '(NYXT::VI-NORMAL-MODE) %SLOT-DEFAULT%))))
(DEFINE-CONFIGURATION PROMPT-BUFFER
  ((DEFAULT-MODES (APPEND '(NYXT::VI-INSERT-MODE) %SLOT-DEFAULT%))))
(define-configuration buffer
  ((default-modes (append '(nyxt::vi-normal-mode) %slot-default%))))
