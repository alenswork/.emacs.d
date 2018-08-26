;;Package link to melpa
;;------------------------------------------------------------------------------

(setq package-archives '(("org" . "http://orgmode.org/elpa/")
			 ("melpa" . "http://melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))
  (setq package-enable-at-startup nil)
  (package-initialize)

;;Location for custom data added in by emacs
;;------------------------------------------------------------------------------
  (setq custom-file (concat user-emacs-directory "custom.el"))
  (when (file-exists-p custom-file)
    (load custom-file))

;;Frocing UTF-8 Encoding
;;------------------------------------------------------------------------------
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; Bootstrap `use-package'
;;------------------------------------------------------------------------------
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package)) ; Need forced execution with C-x C-e

;; Custom startup optimizations and files in .lisp folder
;;------------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'startup)
(require 'personal_info)


;; Loading custom directories
;;------------------------------------------------------------------------------
(require 'load-directory)
;; To load only .el files
(defun load-directory (dir)
  (let ((load-it (lambda (f)
		   (load-file (concat (file-name-as-directory dir) f)))
		 ))
    (mapc load-it (directory-files dir nil "\\.el$"))))
(load-directory "~/.emacs.d/config/")
;; Code to load all .el or .elc files
					; (require 'load-directory)
					; (load-directory "~/.emacs.d/my-lisp")



