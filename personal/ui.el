;; set color theme again - let company's popup aligns with theme
(prelude-require-package 'powerline)
(prelude-require-package 'leuven-theme)
(prelude-require-package 'color-theme-solarized)
(if window-system
    (load-theme prelude-theme t))

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
;; (set-face-attribute 'default nil :height 100)


(prelude-require-package 'window-numbering)
(window-numbering-mode 1)

(setq compilation-scroll-output 1)

(global-hl-line-mode -1)


;; (prelude-require-package 'auto-dim-other-buffers)
;; (add-hook 'after-init-hook (lambda ()
;;                              (when (fboundp 'auto-dim-other-buffers-mode)
;;                                (auto-dim-other-buffers-mode t))))
