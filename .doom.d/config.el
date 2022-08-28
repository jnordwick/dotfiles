;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Jason Nordwick"
      user-mail-address "jnordwick@gmail.com")

;; misc defaults
(use-package! help-fns+)

(load! "config-modus.el")
(setq doom-theme 'modus-vivendi)

(make-variable-buffer-local 'compile-command)

(setq doom-font-increment 1)
(setq text-scale-mode-step 1.05) ; ~1pt around 20

;; (use-package! modus-themes
;;   :init
;;   ;; modeline and tabs
;;   (setq modus-themes-mode-line '(accented (padding . 4) (height 0.9))
;;         x-underline-at-descent-line t
;;         x-use-underline-position-properties t
;;         modus-themes-region '(accented bg-only no-extend)
;;         modus-themes-tabs-accented t)
;;   ;; completions framesworks
;;   (setq modus-themes-completions
;;         '((matches . (extrabold background intense))
;;           (selection  . (semibold accented text-to intense))
;;           (popup . (accented text-to))
;;           (t . (accented intense))))

;;   ;; checkers
;;   (setq modus-themes-lang-checkers '(background text-also faint))
;;   ;; NOTE lookup `lin` package for sylized current line
;;   ;; current line
;;   (setq modus-themes-hl-line '(accented intense))
;;   (setq modus-themes-fringes 's)
;;   ;; line numbers
;;   (setq modus-themes-subtle-line-numbers t)
;;   (load-theme 'modus-vivendi t)
;;   )


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


;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - doom-unicode-font -- for unicode glyphs

;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq
 ;; doom-font (font-spec :family "MesloLGSDZ Nerd Font" :size 16 :weight 'regular)
 doom-font (font-spec :family "Fira Code Nerd Font" :size 22 :weight 'regular)
 doom-variable-pitch-font (font-spec :family "Liberation Sans" :size 22 :weight 'regular)
 doom-unicode-font (font-spec :family "all-the-icons" :size 18 :weight 'regular)
 )
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-solarized-dark)
;;(setq doom-theme 'doom-tomorrow-night)
                                        ;(setq doom-theme 'doom-vibrant)
(setq doom-theme 'doom-acario-dark)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;
;; org mode
;;
 (add-hook! 'org-mode-hook #'mixed-pitch-mode)
 (add-hook! 'org-mode-hook #'solaire-mode)


;;;
;;; modeline hacking (currently using doom modeline)
;;;
(use-package minions
 :config
  (minions-mode 1))

;;
;; flycheck
;;
(map! :map global-map
      "C-c !" nil)

(map! :after flycheck
      (:map global-map
       "C-c !" nil)
      (:map flycheck-mode-map
       :n "! x" #'flycheck-disable-checker
       :n "! v" #'flycheck-verify-checker
       :n "! V" #'flycheck-version
       :n "! ?" #'flycheck-describe-checker
       :n "! s" #'flycheck-select-checker
       :n "! W" #'flycheck-copy-errors-as-kill
       :n "! l" #'flycheck-list-errors
       :n "! i" #'flycheck-manual
       :n "! e" #'flycheck-dispay-error-at-point
       :n "! E" #'flycheck-explain-error-at-point
       :n "! k" #'flycheck-previous-error
       :n "! j" #'flycheck-next-error
       :n "! c" #'flycheck-compile
       :n "! ~" #'flycheck-clear
       :n "! b" #'flycheck-buffer))
;;
;; lsp / refactorings
;;
(map! :after lsp-mode
      (:leader
       :n "c r" nil
       :n "c o" nil)
      (:mode lsp-mode
       :leader
       :prefix ("l" . "LSP refactorings")
       :n "r" #'lsp-rename
       :n "i" #'lsp-organize-imports
       (:prefix ("g" . "goto")
        :n "p" #'lsp-find-declaration
        :n "d" #'lsp-find-definition
        :n "r" #'lsp-find-references)
       (:prefix ("l" . "look")
        :n "l d" #'lsp-ui-peek-find-definitions
        :n "l r" #'lsp-ui-peek-find-references)))
;;
;; c++
;;
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(setq +format-with-lsp nil)
(setq c-default-style "user")
(setq +format-with-lsp nil)

(after! (lsp-mode lsp-ui)
  ;; trim the watch list a little, build and doxygen
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]build$")
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]html$")
  (setq lsp-clients-clangd-args '("-j=3"
                                  "-pretty"
                                  "--std=c++20"
                                  "--background-index"
                                  "--clang-tidy"
                                  "--fallback-style=llvm"
                                  "--completion-style=detailed"
                                  "--header-insertion=never"
                                  "--header-insertion-decorators=0"))
  ;; change doom defaults
  (setq lsp-enable-text-document-color t
        lsp-senamtic-tokens-enable t
        lsp-enable-file-watchers t
                                        ; doom disaled thsoe below here
        lsp-enable-indentation nil
        lsp-enable-on-type-formatting nil
        lsp-enable-folding nil))
(after! lsp-clangd
  (set-lsp-priority! 'clangd 2)) ; movin' on up

(map! :mode c++-mode
      :leader
      :n "]" #'next-error
      :n "[" #'previous-error)

;;
;; more evil-like
;;
(map! :after counsel
      :leader
      (:n ":" nil
       :n "x" #'counsel-M-x)
      :n "E" #'eval-expression)

;;
;; treemacs
;;
(defun me/treemacs-flip ()
  (interactive)
  (if (treemacs-is-treemacs-window-selected?)
      (evil-window-prev 0)
    (treemacs-select-window)))
(map! :after treemacs
      :leader
      :n "0" #'me/treemacs-flip)
;;
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

(after! switch-window
  (map! :map global-map
        :g "C-q" nil
        :prefix ("C-q" . "switch-buffer commands")
        :g "C-q" #'switch-window
        :g "1" #'switch-window-then-maximize
        :g "2" #'switch-window-then-split-below
        :g "3" #'switch-window-then-split-right
        :g "0" #'switch-window-then-delete
        :g "4 d" #'switch-window-then-dired
        :g "4 f" #'switch-window-then-find-file
        :g "4 r" #'switch-window-then-find-file-read-only
        :g "4 o" #'switch-window-then-display-buffer
        :g "4 0" #'switch-window-then-kill-buffer
        ))
;;
;; lin
;;
(use-package! lin
  :config
  (setq lin-face 'lin-blue)
  (setq lin-mode-hooks
        '(bongo-mode-hook
          dired-mode-hook
          elfeed-search-mode-hook
          git-rebase-mode-hook
          grep-mode-hook

          ilist-mode-hook
          ledger-report-mode-hook
          log-view-mode-hook
          magit-log-mode-hook
          mu4e-headers-mode
          notmuch-search-mode-hook
          notmuch-tree-mode-hook
          occur-mode-hook
          org-agenda-mode-hook
          proced-mode-hook
          tabulated-list-mode-hook))

  (lin-global-mode 1)
  )

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

