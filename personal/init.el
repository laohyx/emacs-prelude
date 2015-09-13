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
(global-set-key "\C-x\ \C-r" 'helm-recentf)
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
(when (window-system)
  (company-quickhelp-mode 1))

(add-hook 'ggtags-find-tag-hook (lambda ()
                                  (recenter)))

(prelude-require-package 'hideshowvis)

(when (window-system)
  (dolist (hook (list 'emacs-lisp-mode-hook
                      'c++-mode-hook))
    (add-hook hook 'hideshowvis-enable))
  (hideshowvis-symbols))

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(setq org-support-shift-select t)

(prelude-require-package 'ag)

(prelude-require-package 'key-chord)
(require 'key-chord)


(defun company-yasnippet-or-completion ()
  (interactive)
  (let ((yas-fallback-behavior nil))
    (unless (yas-expand)
      (call-interactively #'company-complete-common))))
(add-hook 'company-mode-hook (lambda ()
                               (substitute-key-definition 'company-complete-common
                                                          'company-yasnippet-or-completion
                                                          company-active-map)))

(prelude-require-package 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(setq emmet-move-cursor-between-quotes t) ;; default nil


(add-hook 'LaTeX-mode-hook (lambda ()
                             (flycheck-mode -1)
                             (whitespace-mode -1)
                             (auto-fill-mode -1)) t)

(add-hook 'shell-mode-hook (lambda ()
                             (company-mode -1)) t)
