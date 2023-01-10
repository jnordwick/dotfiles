;;; config-cpp.el -*- lexical-binding: t; -*-


;;
;; c++
;;
(make-variable-buffer-local 'compile-command)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(setq c-default-style "user")
(setq +format-with-lsp t)

(add-hook! (cc-mode c++-mode)
  (make-local-variable 'fill-column)
  (make-local-variable 'comment-auto-fill-only-comments)
  (auto-fill-mode t)
  (setq fill-column 100
        comment-auto-fill-only-comments t))

(after! lsp-mode
  ;; trim the watch list a little, build and doxygen
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]build$")
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]html$")
  (setq lsp-clients-clangd-args
        (list (concat "-j=" (int-to-string (/ (num-processors) 1)))
              (concat "--compile-commands-dir=" (projectile-project-root) "/build")
              "--all-scopes-completion"
              "--background-index"
              "--clang-tidy"
              "--completion-style=detailed"
              "--fallback-style=mozilla"
              "--function-arg-placeholders"
              "--header-insertion=iwyu"
              "--header-insertion-decorators=1"
              "--enable-config"
              "--malloc-trim"
              "--log=verbose"))
  ;; change doom defaults
  (setq lsp-enable-text-document-color nil
        lsp-semantic-tokens-enable nil
        lsp-enable-file-watchers nil))

(after! lsp-clangd
  (set-lsp-priority! 'clangd 2)) ; movin' on up

(map! :mode c++-mode
      :nvi "M-[" #'previous-error)
;;
;; flycheck
;;

(map! :map global-map
      "C-c !" nil)

(map! :after flycheck
      (:map global-map
            "C-c !" nil)
      (:map flycheck-mode-map
       :prefix ("!" . "flycheck")
       :n "!" #'flycheck-buffer
       :n "~" #'flycheck-clear
       :n "?" #'flycheck-describe-checker
       :n "{" #'flycheck-previous-error
       :n "}" #'flycheck-next-error
       :n "C" #'flycheck-compile
       :n "E" #'flycheck-dispay-error-at-point
       :n "I" #'flycheck-manual
       :n "L" #'flycheck-list-errors
       :n "R" #'flycheck-explain-error-at-point
       :n "S" #'flycheck-select-checker
       :n "V" #'flycheck-verify-checker
       :n "W" #'flycheck-copy-errors-as-kill
       :n "X" #'flycheck-disable-checker))

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
