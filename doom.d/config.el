;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(setq user-full-name "Jason Nordwick"
      user-mail-address "jnordwick@gmail.com")

;; misc defaults
(use-package! help-fns+)
(setq which-key-idle-delay 0.5)

(load! "config-modus")
(setq doom-theme 'modus-vivendi)

(load! "config-cpp")
(load! "config-ui")
(load! "config-treemacs")

(setq doom-font-increment 1)
(setq text-scale-mode-step 1.05) ; ~1pt around 20pts

(setq-default
 delete-by-moving-to-trash t
 window-combination-resize t
 x-stretch-cursor t)

(setq undo-limit 50000000
      evil-want-fine-undo t
      auto-save-default t
      make-backup-file t
      truncate-string-ellipsis "…"
      scroll-margin 3)

(display-time-mode 1)

(unless (string-match-p "^Power N/A" (battery))
  (display-battery-mode 1))

(global-subword-mode 1)

(setq display-line-numbers-type 'relative)

(setq
 ;; doom-font (font-spec :family "MesloLGSDZ Nerd Font" :size 20 :weight 'regular)
 ;; doom-font (font-spec :family "Comic Mono" :size 22)
 doom-font (font-spec :family "Fira Code Nerd Font" :size 18 :weight 'regular)
 doom-variable-pitch-font (font-spec :family "Liberation Sans" :size 18 :weight 'regular)
 doom-unicode-font (font-spec :family "Noto Sans Mono" :weight 'regular)
 )


;;
;; org mode
;;
(setq org-directory "~/org/")

(after! (org evil)
  (add-hook! 'org-mode-hook #'mixed-pitch-mode)
  (add-hook! 'org-mode-hook #'solaire-mode))


;;;
;;; modeline hacking (currently using doom modeline)
;;;
(use-package minions
  :config
  (minions-mode 1))

;;
;; more evil-like
;;
(map! :after counsel
      :leader
      (:n ":" nil
       :n "x" #'counsel-M-x
       :n "E" #'eval-expression))

;; general windows and buffers
;;
(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (counsel-switch-buffer))

(defun me/delete-other-window-for-scrolling ()
  (interactive)
  (delete-window (other-window-for-scrolling)))

(map! :map global-map
      "C-M-h" #'evil-window-left
      "C-M-l" #'evil-window-right
      "C-M-k" #'evil-window-up
      "C-M-j" #'evil-window-down)

(map! :leader
      :n "w c" #'me/delete-other-window-for-scrolling)

