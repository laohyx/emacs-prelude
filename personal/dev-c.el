;; gtags
(prelude-require-package 'ggtags)
(add-hook 'c++-mode-hook 'ggtags-mode)
(add-hook 'c-mode-hook 'ggtags-mode)
(add-hook 'objc-mode-hook 'ggtags-mode)

;; c-headers
(prelude-require-package 'company-c-headers)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-c-headers))
;; irony
(prelude-require-package 'irony)
(require 'irony)
(defun my-c++-hooks ()
  (yas/minor-mode-on)
  (when (member major-mode irony-supported-major-modes)
    (irony-mode 1))
  ;; restart whitespace-mode to load the tab-width
  (when (bound-and-true-p whitespace-mode)
    (setq whitespace-tab-width 'tab-width)
    (whitespace-mode -1)
    (whitespace-mode +1))
  )

(add-hook 'c++-mode-hook 'my-c++-hooks)
(add-hook 'c-mode-hook 'my-c++-hooks)
(add-hook 'objc-mode-hook 'my-c++-hooks)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(prelude-require-package 'company-irony)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; (optional) adds CC special commands to `company-begin-commands' in order to
;; trigger completion at interesting places, such as after scope operator
;;     std::|
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(prelude-require-package 'flycheck-irony)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook 'flycheck-irony-setup))

(prelude-require-package 'flycheck-irony)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
