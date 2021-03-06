;; Initialize packages sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 			 ("org" . "https://orgmode.org/elpa/")
						 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(counsel monokai-pro-theme magit rainbow-delimiters doom-modeline use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'default-frame-alist '(font . "Fira Mono-14"))		;; Set the font
(scroll-bar-mode -1)											;; Disable scrollbar
(tool-bar-mode -1)												;; Disable tool bar
(tooltip-mode -1)												;; Disable tool tip
(menu-bar-mode -1)												;; Disable menu bar
(setq visible-bell t)											;; Enable visual bell
(electric-pair-mode 1)											;; Set Auto Pairs
(global-visual-line-mode 1)
(setq-default display-line-numbers 'relative)
(setq-default tab-width 4)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(set-language-environment "UTF-8")
(global-hl-line-mode 1)
(setq-default inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

(use-package monokai-pro-theme
  :ensure t
  :config
  (load-theme 'monokai-pro t))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package all-the-icons
  :ensure t)

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package magit
  :ensure t
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package rainbow-mode
  :ensure t
  :hook (prog-mode . rainbow-mode))

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
	  backup-by-copying t
	  version-control t
	  delete-old-verstion t
	  kept-new-versions 20
	  kept-old-versions 5
	  )
