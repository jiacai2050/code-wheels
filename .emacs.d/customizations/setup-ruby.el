;;; -*- lexical-binding: t; -*-

(use-package ruby-mode
  :mode ("\\.rake$"
         "\\.gemspec$"
         "\\.ru$"
         "\\.cap$"
         "\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file$"
         ;; "Rakefile$"
         ;; "Gemfile$"
         ;; "Capfile$"
         ;; "Vagrant$"
         ;; "Guardfile$"
         ))

(use-package robe
  :after ruby-mode
  :hook ((ruby-mode . robe-hook))
  :config
  (add-hook 'ruby-mode-hook (lambda ()
                              (push 'company-robe company-backends))))

(use-package ruby-end
  :defer t)

(use-package inf-ruby)
