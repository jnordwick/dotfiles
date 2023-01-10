;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;
;; fake pre-load stuff goes here
;;
(setq +treemacs-git-mode 'deferred)

;;
;; the rest

(setq fancy-splash-image "~/.doom.d/crabel-dark-lg.svg")

(setq user-full-name "Jason Nordwick"
      user-mail-address "jnordwick@crabel.com")

(setq doom-font-increment 1
      text-scale-mode-step 1.05)

(setq-default
 delete-by-moving-to-trash t
 window-combination-resize t
 x-stretch-cursor t)

(setq undo-limit 1000000
      evil-want-fine-undo t
      auto-save-default t
      make-backup-files t
      truncate-string-ellipsis "…"
      scroll-margin 3)

(setq display-line-numbers-type 'relative)
(display-time-mode 1)

(setq
 ;; doom-font (font-spec :family "MesloLGSDZ Nerd Font" :size 20 :weight 'regular)
 ;; doom-font (font-spec :family "Comic Mono" :size 22)
 ;; doom-font (font-spec :family "Lilex NF" :size 18 :weight 'regular)
doom-font (font-spec :family "FiraCode NF" :size 38  :weight 'semibold)
;; doom-variable-pitch-font (font-spec :family "Liberation Sans" :size 22 :weight 'regular)
;; doom-unicode-font (font-spec :family "Noto Sans Mono" :weight 'regular)
)
(load! "config-modus")
(load! "config-ef")
(load! "config-ui")

;;
;; modeline hacking (currently using doom modeline)
;
(use-package minions
  :config
  (minions-mode 1))

;;
;; more evil-like
;;
(map! :leader
      :g "x" #'execute-extended-command
      (:g "M-s-;") :g ":" #'eval-expression
      :g "." #'ffap)

;;
;; more windows like
;;
(map! :map global
      "M-<f1>" #'embark-bindings
      "M-<f2>" #'describe-key
      "<F14>" #'embark-bindings-at-point
      "<XF86Launch5>" #'embark-bindings-at-point
      "M-+" #'calc
      "C-M-+" #'full-calc
      )

;; fat-fingering this for years
(map! :map global-map "C-x C-c")

;;
;; marginalia, orderless
;;
(use-package! orderless
  :custom (completion-styles '(orderless)))

(use-package! marginalia
  :init (marginalia-mode)
  :bind
  (("M-A" . #'marginalia-cycle)
   :map minibuffer-local-map
   ("M-A" . #'marginalia-cycle)))

;;
;; Dired 
;;
(map! :leader
      :prefix ("d" . "dired")
      :g "d" #'+default/dired
      :g "j" #'dired-jump
      :g "C-j" #'dired-jump-other-window
      :g "f" #'fd-dired
      :g "F" #'find-dired
      :g "i" #'image-dired
      :g "I" #'ido-dired
      :g "p" #'projectile-dired)

;;
;; spacemacs style window and buffer switching
;;
(map! :leader
      (:g "w0") (:g "0" #'winum-select-window-0-or-10)
      (:g "w1") (:g "1" #'winum-select-window-1)
      (:g "w2") (:g "2" #'winum-select-window-2)
      (:g "w3") (:g "3" #'winum-select-window-3)
      (:g "w4") (:g "4" #'winum-select-window-4)
      (:g "w5") (:g "5" #'winum-select-window-5)
      (:g "w6") (:g "6" #'winum-select-window-6)
      (:g "w7") (:g "7" #'winum-select-window-7)
      (:g "w8") (:g "8" #'winum-select-window-8)
      (:g "w9") (:g "9" #'winum-select-window-9))


;(load! "config-treemacs") ; wrecks lsp for now
(load! "config-jira")
(load! "config-org")
(load! "config-cpp")
