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
;; pulsar - show where you move to
;;
(use-package! pulsar
  :config
  (setq pulsar-pulse t
        pulsar-delay 0.5
        pulsar-interations 10
        pulsar-face 'pulsar-magenta
        pulsar-highlight-face 'pulsar-yellow)
  (pulsar-global-mode 1)

  ;; integration with next-error
  (add-hook 'next-error-hook #'pulsar-pulse-line)
  ;; integration with the `consult' package:
  (add-hook 'consult-after-jump-hook #'pulsar-recenter-top)
  (add-hook 'consult-after-jump-hook #'pulsar-reveal-entry)
  ;; integration with the built-in `imenu':
  (add-hook 'imenu-after-jump-hook #'pulsar-recenter-top)
  (add-hook 'imenu-after-jump-hook #'pulsar-reveal-entry)
  )

