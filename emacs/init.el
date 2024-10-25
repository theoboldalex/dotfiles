(package-initialize)
(setq ring-bell-function 'ignore)
(set-frame-font "Jetbrains Mono Light 10" nil t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
;;(global-display-line-numbers-mode)

;; Yes-or-No queries become Y-or-N
(fset 'yes-or-no-p 'y-or-n-p)

(ido-mode t)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; this is the original M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f3781be0be23cc71c89b317489e07a4ad3e885f84c0a618692b53bbd69e60843" "9bed3fb18c8d18acca50f3609efcaa8d1c72027802cec8d291d4577e3e48b825" "e27c9668d7eddf75373fa6b07475ae2d6892185f07ebed037eedf783318761d7" default))
 '(package-selected-packages
   '(lsp-mode magit clojure-mode smex leuven-theme paredit which-key gruber-darker-theme cider)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'gruber-darker)

