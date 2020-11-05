;; Define package repositories
(require 'package)

(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")
                         ("marmalada" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/")))

;; add cask dependencies
(let ((cask-bootstrap-emacs-version (format "%s.%s" emacs-major-version emacs-minor-version)))
  (add-to-list 'package-directory-list (expand-file-name (format "~/.emacs.d/vendor/lsp-mode/.cask/%s/elpa" cask-bootstrap-emacs-version)))
  (add-to-list 'package-directory-list (expand-file-name (format "~/.emacs.d/vendor/lsp-treemacs/.cask/%s/elpa" cask-bootstrap-emacs-version)))
  )

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(
    use-package
    use-package-ensure-system-package
    ))

;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(when (eq system-type 'darwin)
  (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
(setq use-package-always-ensure t)

(defun my/map-key (key)
  "Map KEY from escape sequence \"\e[emacs-KEY\."
  (define-key function-key-map (concat "\e[emacs-" key) (kbd key)))

(defun my/global-map-and-set-key (key command &optional prefix suffix)
  "`my/map-key' KEY then `global-set-key' KEY with COMMAND.
PREFIX or SUFFIX can wrap the key when passing to `global-set-key'."
   (my/map-key key)
   (global-set-key (kbd (concat prefix key suffix)) command))

;;;;
;; Customization
;;;;
(setq custom-file (concat user-emacs-directory ".custom.el"))

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; For editing lisps
(load "elisp-editing.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; Langauage-specific
(load "setup-org.el")
(load "setup-clojure.el")
(load "setup-js.el")
(load "setup-common-lisp.el")
(load "setup-ruby.el")
(load "setup-python.el")
(load "setup-go.el")
(load "setup-rust.el")

;; settings for all langauage
(load "setup-progn.el")
(org-babel-load-file "~/.emacs.d/customizations/misc.org")

;; end
