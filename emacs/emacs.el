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
  (dotimes (n 3)
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

;; fuzzy file finder
(use-package fzf
  :defer t
  :config
  (setq
   fzf/args "-x --print-query --margin=1,0 --no-hscroll"
   fzf/executable "fzf"
   fzf/git-grep-args "-i --line-number %s"        
   fzf/grep-command "rg --no-heading -nH"        
   fzf/position-bottom t        
   fzf/window-height 15)  
  :bind (
	 ("s-f g" . (lambda (&optional x) (interactive "P")
                      (if x (fzf-git-grep) (fzf-grep))))
	 ("s-f f" . (lambda (&optional x) (interactive "P")
                      (if x (fzf-git) (fzf))))))
(use-package yaml-mode
  :ensure t)

;; Auto generated code beyond this point
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruvbox-dark-hard))
 '(custom-safe-themes
   '("9b55271bec4b2bae7eca6c96eac974b19f2f6d8cccc8fd34b30ab67220bb19d5" "db86c52e18460fe10e750759b9077333f9414ed456dc94473f9cf188b197bc74" "19a2c0b92a6aa1580f1be2deb7b8a8e3a4857b6c6ccf522d00547878837267e7" "3e374bb5eb46eb59dbd92578cae54b16de138bc2e8a31a2451bf6fdb0f3fd81b" "fa49766f2acb82e0097e7512ae4a1d6f4af4d6f4655a48170d0a00bcb7183970" "98b4ef49c451350c28a8c20c35c4d2def5d0b8e5abbc962da498c423598a1cdd" "2ff9ac386eac4dffd77a33e93b0c8236bb376c5a5df62e36d4bfa821d56e4e20" "72ed8b6bffe0bfa8d097810649fd57d2b598deef47c992920aef8b5d9599eefe" "b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d" "d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" "d41229b2ff1e9929d0ea3b4fde9ed4c1e0775993df9d998a3cdf37f2358d386b" "7b602fe4a324dc18877dde647eb6f2ff9352566ce16d0b888bfcb870d0abfd70" "fbf73690320aa26f8daffdd1210ef234ed1b0c59f3d001f342b9c0bbf49f531c" "712dda0818312c175a60d94ba676b404fc815f8c7e6c080c9b4061596c60a1db" "2e7dc2838b7941ab9cabaa3b6793286e5134f583c04bde2fba2f4e20f2617cf7" "a75aff58f0d5bbf230e5d1a02169ac2fbf45c930f816f3a21563304d5140d245" "937401a2e532f2c8c881b6b3f20d9d4b6b9405bccf72ea6289c9d3f4507eb1ab" "faf642d1511fb0cb9b8634b2070a097656bdb5d88522657370eeeb11baea4a1c" "0517759e6b71f4ad76d8d38b69c51a5c2f7196675d202e3c2507124980c3c2a3" "5a0ddbd75929d24f5ef34944d78789c6c3421aa943c15218bac791c199fc897d" "8363207a952efb78e917230f5a4d3326b2916c63237c1f61d7e5fe07def8d378" "f366d4bc6d14dcac2963d45df51956b2409a15b770ec2f6d730e73ce0ca5c8a7" "1114c56feb07fb44ad12ede602c566a1387aeffcf5990a446952d54fba620be3" "01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd" default))
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
