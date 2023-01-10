;;; config-ui.el -*- lexical-binding: t; -*-

;;
;; lin - better highlight line
;;
(use-package! lin
  :config
  (setq lin-face 'lin-blue)
  (lin-global-mode 1)
  )

;;
;; pulsar - show where you jump to
;;
(use-package! pulsar
  :config
  (setq pulsar-pulse t
        pulsar-delay 0.5
        pulsar-iterations 10
        pulsar-face 'pulsar-magenta
        pulsar-highlight-face 'pulsar-yellow)
  (pulsar-global-mode 1)

  (add-hook! 'next-error-hook #'pulsar-pulse-line)
  (add-hook! 'consult-after-jump-hook #'pulsar-recenter-top #'pulsar-pulse-line-magenta)
  (add-hook! 'consult-after-jump-hook #'pulsar-reveal-entry #'pulsar-pulse-line-magenta)
  (add-hook! 'imenu-after-jump-hook #'pulsar-recenter-top #'pulsar-pulse-line)
  (add-hook! 'imenu-after-jump-hook #'pulsar-reveal-entry #'pulsar-pulse-line))


(after! (auto-dim-other-buffers ef-themes)
  :config
  (ef-themes-with-colors
    (custom-set-faces
     `(auto-dim-other-buffers-face ((,c :background ,bg-inactive)))))
  (setq auto-dim-other-buffers-dim-on-switch-to-minibuffer  nil
        auto-dim-other-buffers-dim-on-focus-out nil)
  (auto-dim-other-buffers-mode 1)
  )

