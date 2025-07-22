(package-initialize)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Yes-or-No queries become Y-or-N
(fset 'yes-or-no-p 'y-or-n-p)

;; basic look and feel
(defun get-default-font ()
  (cond
   ((eq system-type 'darwin) "JetBrainsMono Nerd Font 14")
   ((eq system-type 'gnu/linux) "JetBrainsMono Nerd Font 11")))

;;;; colorize output in compile buffer
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (ansi-color-apply-on-region compilation-filter-start (point-max)))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; MacOs stuff
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta
	mac-right-command-modifier 'super
	mac-option-modifier 'meta
	frame-resize-pixelwise t)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (dotimes (n 5)
    (toggle-frame-maximized)))

;; hide all the cruft
(transient-mark-mode 1)
(set-frame-font (get-default-font) nil t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)
;;(global-display-line-numbers-mode)
;;(setq display-line-numbers-type 'relative)
(setq ring-bell-function 'ignore)
(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq rust-format-on-save t)

;; dired
(setq dired-listing-switches "-lah --group-directories-first")
(add-hook 'dired-mode-hook
	  (lambda () (dired-hide-details-mode)))

;; idosmex
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "s-x") 'smex) ;; spent too many years on MacOs
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; paredit
(require 'paredit)

(defun turn-on-paredit ()
  (interactive)
  (paredit-mode 1))

(add-hook 'emacs-lisp-mode-hook  'turn-on-paredit)
(add-hook 'clojure-mode-hook     'turn-on-paredit)
(add-hook 'lisp-mode-hook        'turn-on-paredit)
(add-hook 'common-lisp-mode-hook 'turn-on-paredit)
(add-hook 'scheme-mode-hook      'turn-on-paredit)
(add-hook 'racket-mode-hook      'turn-on-paredit)

;; LSP
(use-package lsp-mode
  :config
  (setq lsp-prefer-flymake nil)
  :hook (go-mode . lsp)
  :hook (php-mode . lsp)
  :hook (rust-mode . lsp)
  :commands lsp)

;; Company
(use-package company
  :config
  (global-company-mode))

;; Org mode
(require 'org)
(setq org-link-frame-setup '((file . find-file)))

(use-package yaml-mode
  :ensure t)

;; Auto generated code beyond this point
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(leuven))
 '(custom-safe-themes
   '("d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" default))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(rust-mode yaml-mode fzf jetbrains-darcula-theme material-theme nord-theme cider clojure-mode gruvbox-theme dracula-theme magit company go-mode php-mode lsp-mode paredit gruber-darker-theme smex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; my custom functions
(defun brain ()
  "opens a dired buffer in the current window with PWD at my notes dir"
  (interactive)
  (let ((filepath "~/Desktop/brain/"))
  (find-file filepath)))

(defun blog (post-name)
  "Create a new blog post with Hugo in the posts/ directory."
  (interactive "sPost name (without extension): ")
  (let* ((repo-root "~/code/theoboldalex.github.io/")
	 (ext ".md")
         (default-directory (file-name-as-directory repo-root))
	 (file-path (concat "content/posts/" post-name ext))
         (cmd (concat "hugo new posts/" post-name ext)))
    (shell-command cmd)
    (find-file file-path)))

(put 'downcase-region 'disabled nil)

(defun econf ()
  "opens my .emacs config file"
  (interactive)
  (find-file "~/.emacs"))

(defun econf-reload ()
  "Reloads the .emacs config file"
  (interactive)
  (load-file "~/.emacs"))
