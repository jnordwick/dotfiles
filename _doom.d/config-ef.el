;;; config-ef.el -*- lexical-binding: t; -*-

;; Make customisations that affect Emacs faces BEFORE loading a theme
;; (any change needs a theme re-load to take effect).
;; (require 'ef-themes)
(use-package! ef-themes)


;; colors defined:
;;   (ef-themes-with-colors
;;     (list bg-main fg-main bg-mode-line cursor))
;;
;;
;; dark themes: ef-at

;; If you like two specific themes and want to switch between them, you
;; can specify them in `ef-themes-to-toggle' and then invoke the command
;; `ef-themes-toggle'.  All the themes are included in the variable
;; `ef-themes-collection'.
(setq ef-themes-to-toggle '(ef-bio ef-winter))

(setq ef-themes-headings ; read the manual's entry or the doc string
      '((0 . (variable-Pitch light 1.9))
        (1 . (variable-pitch light 1.8))
        (2 . (variable-pitch regular 1.7))
        (3 . (variable-pitch regular 1.6))
        (4 . (variable-pitch regular 1.5))
        (5 . (variable-pitch 1.4)) ; absence of weight means `bold'
        (6 . (variable-pitch 1.3))
        (7 . (variable-pitch 1.2))
        (t . (variable-pitch 1.1))))

;; They are nil by default...
(setq ef-themes-mixed-fonts t
      ef-themes-variable-pitch-ui t)

;; Read the doc string or manual for this one.  The symbols can be
;; combined in any order.
(setq ef-themes-region '(intense no-extend neutral))

;; Disable all other themes to avoid awkward blending:
                                        ;(mapc #'disable-theme custom-enable-themes)

;; Load the theme of choice
                                        ;(load-theme 'ef-summer :no-confirm)

;; OR use this to load the theme which also calls `ef-themes-post-load-hook':
(ef-themes-select 'ef-dark)

;; The themes we provide asre recorded in the `ef-hemes-dark-themes',
;; `ef-themes-light-themes'.

;; We also provide these commands, but do not assign them to any key:
;;
;; - `ef-themes-toggle'
;; - `ef-themes-select'
;; - `ef-themes-load-random'
;; - `ef-themes-preview-colors'
;; - `ef-themes-preview-colors-current'

;;
;; better toggle
;;
(defvar +ef-themes-rotation-list
  ef-themes-dark-themes)

(defun +find-next (item lst)
  (let ((next nil)
        (old lst))
    (while (and lst (not next))
      (if (equal item (car lst))
          (setq next (cdr lst)))
      (setq lst (cdr lst)))
    (car (or next old))))

(defun +ef-themes-next-theme ()
  (interactive)
  (let* ((cur (ef-themes--current-theme))
         (next (+find-next cur +ef-themes-rotation-list)))
    (ef-themes-select next)
    (message "Changeed theme to %s" next)
    ))


(defun +ef-themes-hl-todo-faces ()
  "Configure `hl-todo-keyword-faces' with Ef themes colors.
The exact color values are taken from the active Ef theme."
  (ef-themes-with-colors
    (setq hl-todo-keyword-faces
          `(("HOLD" . ,yellow)
            ("TODO" . ,green-warmer)
            ("NEXT" . ,blue)
            ("THEM" . ,magenta)
            ("PROG" . ,cyan-warmer)
            ("OKAY" . ,green-warmer)
            ("DONT" . ,yellow-warmer)
            ("FAIL" . ,red-warmer)
            ("BUG"  . ,red-warmer)
            ("DONE" . ,green-faint)
            ("NOTE" . ,blue-warmer)
            ("KLUDGE" . ,cyan-cooler)
            ("HACK" . ,cyan-cooler)
            ("TEMP" . ,yuellow)
            ("FIXME" . yellow-warmer)
            ("XXX+" . ,red-warmer)
            ("REVIEW" . ,yellow-cooler)
            ("DEPRECATED" . ,yellow-cooler)))))


(defun +ef-themes-mode-line-faces()
  "Set modeline colors"
  (ef-themes-with-colors
    (custom-set-faces
     `(mode-line ((,c :background ,bg-magenta-subtle
                      :foreground ,fg-mode-line
                      :box (:line-width 1 :color ,fg-mode-line))))
     `(mode-line-inactive ((,c :box (:line-width 1 :color ,bg-active)))))))


;(defun +ef-themes-other-faces ()
;  (ef-themes-with-colors
;    (custom-set-faces
;     `(hl-line ((,c :background ,bg-cyan-faint :foreground ,fg-white :box (:line-width 1 :color ,bg-blue-subtle))))))
;)

(add-hook! 'ef-themes-post-load-hook
           #'+ef-themes-mode-line-faces
;;         #'+ef-themes-other-faces
           #'+ef-themes-hl-todo-faces)


(map! :leader
      :prefix ("t" . "pretty colors")
      :n "e" #'ef-themes-select
      :n "p" #'ef-themes-preview-colors
      :n "t" #'ef-themes-toggle
      :n "T" #'+ef-themes-next-theme
      :n "c" #'consult-theme
      :n "v" #'custom-theme-visit-theme)
