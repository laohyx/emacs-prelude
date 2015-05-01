;; company mode
(global-set-key (kbd "M-/") 'company-complete-common)
(setq company-idle-delay 0)

(prelude-require-package 'company-statistics)
(require 'company-statistics)
(company-statistics-mode)
