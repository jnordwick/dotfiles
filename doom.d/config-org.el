;;; config-org.el -*- lexical-binding: t; -*-

;;
;; org mode
;;
(after! (org)
  (add-hook! 'org-mode-hook #'mixed-pitch-mode)
  (setq org-directory "~/Org/"
        org-agenda-files '("~/Org/" "~/cdev/dt/"))
  (setq
   ;; Edit settings
   org-auto-align-tags nil
   org-tags-column 0
   org-fold-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t

   ;; Org styling, hide markup etc.
   org-hide-emphasis-markers t
   org-pretty-entities t
   org-ellipsis "…"

   ;; Agenda styling
   org-agenda-tags-column 0
   org-agenda-block-separator ?─
   org-agenda-time-grid
   '((daily today require-timed)
     (800 1000 1200 1400 1600 1800 2000)
     " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
   org-agenda-current-time-string
   "⭠ now ─────────────────────────────────────────────────")
  ;;
  ;; random prefereces

  ;(setq org-return-follows-link t
  ;      org-hide-leading-stars t
  ;      org-log-done t
  ;      org-export-html-style "<link rel=stylesheet href=\"../e/freeshell2.css\" type=\"text/css\t>"
  ;      org-export-with-section-numbers nil
  ;      org-with-toc nil
  ;      org-adapt-indentation nil
  ;      org-agenda-prefix-format "  %-17:c%?-1")

  ;;(setf org-tags-column -65)
  ;;(setf org-special-ctrl-a/e t)
  )

(use-package! org-moden
  :after org
  (global-org-modern-mode))

;;(use-package! org-transclusion
;;  :after org
;;init (map! :map global-map "<f6>" #'org-transclusion-add
;;              :leader
;;              :prefix "n"
;;           "T" #'org-transclusion-mode))
