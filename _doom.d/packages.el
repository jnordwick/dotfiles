;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! ef-themes
  :recipe (:host github :repo "protesilaos/ef-themes"))
(package! org-jira
  :recipe (:host github :repo "ahungry/org-jira"))

;; ui
(package! modus-themes)
(package! minions)
(package! lin)
(package! pulsar)
(package! auto-dim-other-buffers)

;;;(package! org-transclusion)
(package! hyperbole)
;(package! marginalia)

(package! org-projectile)
(package! org-modern)
(package! mixed-pitch)
;(package! elegant-agenda-mode :recipe (:host github :repo "justinbarclay/elegant-agenda-mode"))
