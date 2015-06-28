;; -*-Emacs-Lisp-*-

;; From https://ruby-china.org/topics/2311
;; Scroll cursor, and move the window
(global-set-key [(meta n)] 'window-move-up)
(global-set-key [(meta p)] 'window-move-down)
;; Scroll the other window
(global-set-key [(meta N)] 'other-window-move-up)
(global-set-key [(meta P)] 'other-window-move-down)

(defun window-move-up (&optional arg)
  "Current window move-up 2 lines."
  (interactive "P")
  (if arg
      (scroll-up arg)
    (scroll-up 2)))

(defun window-move-down (&optional arg)
  "Current window move-down 3 lines."
  (interactive "P")
  (if arg
      (scroll-down arg)
    (scroll-down 3)))

(defun other-window-move-up (&optional arg)
  "Other window move-up 1 lines."
  (interactive "p")
  (scroll-other-window arg))

(defun other-window-move-down (&optional arg)
  "Other window move-down 2 lines."
  (interactive "P")
  (if arg
      (scroll-other-window-down arg)
    (scroll-other-window-down 2)))
