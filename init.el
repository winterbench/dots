(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(set-face-attribute 'default nil :font "DinaRemasterII" :height 120)

(setq backup-directory-alist `(("." . ,(expand-file-name "backups/" user-emacs-directory))))

(make-directory (expand-file-name "auto-saves/" user-emacs-directory) t)
(setq auto-save-list-file-prefix (expand-file-name "auto-saves/sessions/" user-emacs-directory)
      auto-save-file-name-transforms `((".*" ,(expand-file-name "auto-saves/" user-emacs-directory) t)))

(use-package no-littering)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(column-number-mode)

(use-package anti-zenburn-theme)
(load-theme 'anti-zenburn t)

(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))
