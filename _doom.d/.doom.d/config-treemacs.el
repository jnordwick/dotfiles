;;; config-treemacs.el -*- lexical-binding: t; -*-

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


(map! :after treemacs
      :map treemacs-mode-map
      (:g "p" nil
      :g "C-c C-p" nil)
      :prefix ("p" . "projects")
      :g "a" #'treemacs-add-project-to-workspace
      :g "A" #'treemacs-projectile
      :g "r" #'treemacs-rename-project
      :g "k" #'treemacs-remove-project-from-workspace
      :g "c" #'treemacs-collapse-project
      :g "C" #'treemacs-display-current-project-exclusively)
