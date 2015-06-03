(global-auto-revert-mode 1)

(winner-mode)


(setq shell-file-name "/bin/bash")
(setq shell-command-switch "-ic")


(if window-system
    (server-start))

(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(windmove-default-keybindings 'meta)
(global-unset-key (vector (list 'shift 'left)))
(global-unset-key (vector (list 'shift 'right)))
(global-unset-key (vector (list 'shift 'up)))
(global-unset-key (vector (list 'shift 'down)))


(prelude-require-package 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 50)
(setq recentf-max-menu-items 50)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(add-to-list 'recentf-exclude "/.emacs.d/elpa/")
(add-to-list 'recentf-exclude "/ido.last")
(add-to-list 'recentf-exclude "/company-statistics-cache.el")
(add-to-list 'recentf-exclude "/.git/COMMIT_EDITMSG")
(add-to-list 'recentf-exclude "/.emacs.desktops")


(prelude-require-package 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)



(prelude-require-package 'yasnippet)
(yas-global-mode 1)
(add-hook 'term-mode-hook (lambda()
                            (setq yas-dont-activate t)))

(prelude-require-package 'smex)
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)



(require 'desktop-menu)
(desktop-menu-mode)
(setq desktop-menu-directory "~/.emacs.d/")
(setq desktop-files-not-to-save "^$")

(prelude-require-package 'diminish)
(require 'diminish)

(prelude-require-package 'company-quickhelp)
(require 'company-quickhelp)
(company-quickhelp-mode 1)


(prelude-require-package 'auto-dim-other-buffers)
(add-hook 'after-init-hook (lambda ()
                             (when (fboundp 'auto-dim-other-buffers-mode)
                               (auto-dim-other-buffers-mode t))))

(add-hook 'ggtags-find-tag-hook (lambda ()
                                  (recenter)))

(prelude-require-package 'hideshowvis)
(dolist (hook (list 'emacs-lisp-mode-hook
                    'c++-mode-hook))
  (add-hook hook 'hideshowvis-enable))
(hideshowvis-symbols)

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(setq org-support-shift-select t)

(prelude-require-package 'ag)

(prelude-require-package 'key-chord)
(require 'key-chord)
(key-chord-define-global "mk" 'set-mark-command)


(defun company-yasnippet-or-completion ()
  (interactive)
  (let ((yas-fallback-behavior nil))
    (unless (yas-expand)
      (call-interactively #'company-complete-common))))
(add-hook 'company-mode-hook (lambda ()
                               (substitute-key-definition 'company-complete-common
                                                          'company-yasnippet-or-completion
                                                          company-active-map)))
