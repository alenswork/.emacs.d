;; Some startup customizations
(defalias 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode -1)
(display-time-mode 1)

;; Change backup file Location
(setq backup-directory-alist '(("." . "~/.backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; Sentence end to single space
(setq sentence-end-double-space nil)

;; Save history
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
        search-ring
        regexp-search-ring))

;; Enable recent file logging
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Custom themes:
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;  (load-theme 'odersky t)
(load-theme 'spolsky t)
;;(load-theme '<name> t)


(provide 'startup)
