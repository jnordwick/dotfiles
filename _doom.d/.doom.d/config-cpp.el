;;; config-cpp.el -*- lexical-binding: t; -*-


;;
;; c++
;;
(make-variable-buffer-local 'compile-command)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(setq +format-with-lsp nil)
(setq c-default-style "user")
(setq +format-with-lsp nil)

(after! (lsp-mode lsp-ui)
  ;; trim the watch list a little, build and doxygen
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]build$")
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]html$")
  (setq lsp-clients-clangd-args '("-j=4"
                                  "--pretty"
                                  "--completion-style=bundled"
                                  "--header-insertion=iwyu"
                                  "--recovery-ast"     ; clang-14
                                  "--enable-config"   ; clang-14
                                  "--log=verbose"     ; error, info
                                  ))


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
      :n "H-]" #'next-error
      :n "H-[" #'previous-error)

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
       :n "x" #'flycheck-disable-checker
       :n "v" #'flycheck-verify-checker
       :n "V" #'flycheck-version
       :n "?" #'flycheck-describe-checker
       :n "s" #'flycheck-select-checker
       :n "W" #'flycheck-copy-errors-as-kill
       :n "l" #'flycheck-list-errors
       :n "i" #'flycheck-manual
       :n "e" #'flycheck-dispay-error-at-point
       :n "E" #'flycheck-explain-error-at-point
       :n "k" #'flycheck-previous-error
       :n "j" #'flycheck-next-error
       :n "c" #'flycheck-compile
       :n "~" #'flycheck-clear
       :n "!" #'flycheck-buffer))
                                        ;
;; lsp / refactorings
;;
(map! :after lsp-mode
      (:leader
       :n "c r" nil
       :n "c o" nil)
      (:mode lsp-mode
       :leader
       :prefix ("l" . "LSP")
       :n "r" #'lsp-rename
       :n "i" #'lsp-organize-imports
       (:prefix ("g" . "goto")
        :n "p" #'lsp-find-declaration
        :n "d" #'lsp-find-definition
        :n "r" #'lsp-find-references)
       (:prefix ("l" . "look")
        :n "l d" #'lsp-ui-peek-find-definitions
        :n "l r" #'lsp-ui-peek-find-references)))


