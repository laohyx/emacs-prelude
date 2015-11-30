;; set color theme again - let company's popup aligns with theme
(prelude-require-package 'powerline)
(prelude-require-package 'leuven-theme)
(prelude-require-package 'color-theme-solarized)
(prelude-require-package 'atom-dark-theme)
(prelude-require-package 'atom-one-dark-theme)
;; (if window-system
;;     (load-theme 'atom-one-dark t))

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super))

(prelude-require-package 'better-defaults)


(prelude-require-package 'better-defaults)
(require 'better-defaults)


;; set initial frame size
(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 160))
;; set font size. height / 10 = pt. Default is 120 (12 pt)
;; (set-face-attribute 'default nil :height 100)


(prelude-require-package 'window-numbering)
(window-numbering-mode 1)

(setq compilation-scroll-output 1)

(global-hl-line-mode -1)


;; (prelude-require-package 'auto-dim-other-buffers)
;; (add-hook 'after-init-hook (lambda ()
;;                              (when (fboundp 'auto-dim-other-buffers-mode)
;;                                (auto-dim-other-buffers-mode t))))
