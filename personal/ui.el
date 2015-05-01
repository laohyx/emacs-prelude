;; set color theme again - let company's popup aligns with theme
(prelude-require-package 'leuven-theme)
(if window-system
    (load-theme prelude-theme t)
  (global-hl-line-mode -1))

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super))

(prelude-require-package 'better-defaults)


(prelude-require-package 'better-defaults)
(require 'better-defaults)


;; set initial frame size
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 180))
;; set font size. height / 10 = pt. Default is 120 (12 pt)
(set-face-attribute 'default nil :height 100)


(setq compilation-scroll-output 1)
