;;; config-jira.el -*- lexical-binding: t; -*-

(after! org-jira
  (setq jiralib-url "https://crabel.atlassian.net"))

(map! :after org-jira
      :mode org-jira
      :leader
      :prefix ("j" . "Jira")

      (:prefix ("p" . "projects")
       :n "g" #'org-jira-get-projects)

      (:prefix ("i" . "issues")
      :n "b" #'org-jira-browse-issue
      :n "g" #'org-jira-get-issues
      :n "j" #'org-jira-get-issues-from-custom-jql
      :n "h" #'org-jira-get-issues-headonly
      :n "u" #'org-jira-update-issue
      :n "w" #'org-jira-progress-issue
      :n "n" #'org-jira-progress-issue-next
      :n "a" #'org-jira-assign-issue
      :n "r" #'org-jira-refresh-issue
      :n "R" #'org-jira-refresh-issues-in-buffer
      :n "c" #'org-jira-create-issue
      :n "k" #'org-jira-copy-current-issue-key
      :n "f" #'org-jira-get-issues-by-fixversion)

      (:prefix ("s" . "subtask")
      :n "c" #'org-jira-create-subtask
      :n "g" #'org-jira-get-subtasks)

      (:prefix ("c" . "comment")
      :n "c" #'org-jira-add-comment
      :n "u" #'org-jira-update-comment)

      (:prefix ("w" . "worklogs")
      :n "u" #'org-jira-update-worklogs-from-org-clocks)

      (:prefix ("t". "todo")
      :n "j" #'org-jira-todo-to-jira))
