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
   '("b3ba955a30f22fe444831d7bc89f6466b23db8ce87530076d1f1c30505a4c23b" "59c36051a521e3ea68dc530ded1c7be169cd19e8873b7994bfc02a216041bf3b" "e8bd9bbf6506afca133125b0be48b1f033b1c8647c628652ab7a2fe065c10ef0" "e4a702e262c3e3501dfe25091621fe12cd63c7845221687e36a79e17cf3a67e0" "b99ff6bfa13f0273ff8d0d0fd17cc44fab71dfdc293c7a8528280e690f084ef0" "7c3d62a64bafb2cc95cd2de70f7e4446de85e40098ad314ba2291fc07501b70c" "1f292969fc19ba45fbc6542ed54e58ab5ad3dbe41b70d8cb2d1f85c22d07e518" "4d5d11bfef87416d85673947e3ca3d3d5d985ad57b02a7bb2e32beaf785a100e" "7771c8496c10162220af0ca7b7e61459cb42d18c35ce272a63461c0fc1336015" "5c8a1b64431e03387348270f50470f64e28dfae0084d33108c33a81c1e126ad6" "4594d6b9753691142f02e67b8eb0fda7d12f6cc9f1299a49b819312d6addad1d" "77fff78cc13a2ff41ad0a8ba2f09e8efd3c7e16be20725606c095f9a19c24d3d" "0d2c5679b6d087686dcfd4d7e57ed8e8aedcccc7f1a478cd69704c02e4ee36fe" "0f1341c0096825b1e5d8f2ed90996025a0d013a0978677956a9e61408fcd2c77" "d97ac0baa0b67be4f7523795621ea5096939a47e8b46378f79e78846e0e4ad3d" "21d2bf8d4d1df4859ff94422b5e41f6f2eeff14dd12f01428fa3cb4cb50ea0fb" "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33" "0c83e0b50946e39e237769ad368a08f2cd1c854ccbcd1a01d39fdce4d6f86478" "93011fe35859772a6766df8a4be817add8bfe105246173206478a0706f88b33d" "e14289199861a5db890065fdc5f3d3c22c5bac607e0dbce7f35ce60e6b55fc52" "921f165deb8030167d44eaa82e85fcef0254b212439b550a9b6c924f281b5695" "56044c5a9cc45b6ec45c0eb28df100d3f0a576f18eef33ff8ff5d32bac2d9700" "e8ceeba381ba723b59a9abc4961f41583112fc7dc0e886d9fc36fa1dc37b4079" "3061706fa92759264751c64950df09b285e3a2d3a9db771e99bcbb2f9b470037" "9d5124bef86c2348d7d4774ca384ae7b6027ff7f6eb3c401378e298ce605f83a" "d12b1d9b0498280f60e5ec92e5ecec4b5db5370d05e787bc7cc49eae6fb07bc0" "2ab8cb6d21d3aa5b821fa638c118892049796d693d1e6cd88cb0d3d7c3ed07fc" "0325a6b5eea7e5febae709dab35ec8648908af12cf2d2b569bedc8da0a3a81c1" "5c7720c63b729140ed88cf35413f36c728ab7c70f8cd8422d9ee1cedeb618de5" "b754d3a03c34cfba9ad7991380d26984ebd0761925773530e24d8dd8b6894738" "f253a920e076213277eb4cbbdf3ef2062e018016018a941df6931b995c6ff6f6" "2f7fa7a92119d9ed63703d12723937e8ba87b6f3876c33d237619ccbd60c96b9" "a6920ee8b55c441ada9a19a44e9048be3bfb1338d06fc41bce3819ac22e4b5a1" "d481904809c509641a1a1f1b1eb80b94c58c210145effc2631c1a7f2e4a2fdf4" "fd22a3aac273624858a4184079b7134fb4e97104d1627cb2b488821be765ff17" "87fa3605a6501f9b90d337ed4d832213155e3a2e36a512984f83e847102a42f4" "dfcd2b13f10da4e5e26eb1281611e43a134d4400b06661445e7cbb183c47d2ec" "8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a" "1bc640af8b000ae0275dbffefa2eb22ec91f6de53aca87221c125dc710057511" "e4d4cc443964b8a64defc06de3edb2363f7cb1b3c3ae2272b2c1487f626e4318" "19d62171e83f2d4d6f7c31fc0a6f437e8cec4543234f0548bad5d49be8e344cd" "a368631abdadffb6882f9994637d7216167912311447f1ec02f9dc58e9cc62a9" "72d9086e9e67a3e0e0e6ba26a1068b8b196e58a13ccaeff4bfe5ee6288175432" "4d714a034e7747598869bef1104e96336a71c3d141fa58618e4606a27507db4c" "3f24dd8f542f4aa8186a41d5770eb383f446d7228cd7a3413b9f5e0ec0d5f3c0" "b9761a2e568bee658e0ff723dd620d844172943eb5ec4053e2b199c59e0bcc22" "452068f2985179294c73c5964c730a10e62164deed004a8ab68a5d778a2581da" "088cd6f894494ac3d4ff67b794467c2aa1e3713453805b93a8bcb2d72a0d1b53" "fffef514346b2a43900e1c7ea2bc7d84cbdd4aa66c1b51946aade4b8d343b55a" "f053f92735d6d238461da8512b9c071a5ce3b9d972501f7a5e6682a90bf29725" "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0" "df6dfd55673f40364b1970440f0b0cb8ba7149282cf415b81aaad2d98b0f0290" "f4d1b183465f2d29b7a2e9dbe87ccc20598e79738e5d29fc52ec8fb8c576fcfd" "4990532659bb6a285fee01ede3dfa1b1bdf302c5c3c8de9fad9b6bc63a9252f7" "2f8af2a3a2fae6b6ea254e7aab6f3a8b5c936428b67869cef647c5f8e7985877" "6963de2ec3f8313bb95505f96bf0cf2025e7b07cefdb93e3d2e348720d401425" "dd4582661a1c6b865a33b89312c97a13a3885dc95992e2e5fc57456b4c545176" "f1e8339b04aef8f145dd4782d03499d9d716fdc0361319411ac2efc603249326" "b7a09eb77a1e9b98cafba8ef1bd58871f91958538f6671b22976ea38c2580755" "a9eeab09d61fef94084a95f82557e147d9630fbbb82a837f971f83e66e21e5ad" "e1df746a4fa8ab920aafb96c39cd0ab0f1bac558eff34532f453bd32c687b9d6" "4b88b7ca61eb48bb22e2a4b589be66ba31ba805860db9ed51b4c484f3ef612a7" "32f22d075269daabc5e661299ca9a08716aa8cda7e85310b9625c434041916af" "dfb1c8b5bfa040b042b4ef660d0aab48ef2e89ee719a1f24a4629a0c5ed769e8" "02d422e5b99f54bd4516d4157060b874d14552fe613ea7047c4a5cfa1288cf4f" "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "7ec8fd456c0c117c99e3a3b16aaf09ed3fb91879f6601b1ea0eeaee9c6def5d9" "13096a9a6e75c7330c1bc500f30a8f4407bd618431c94aeab55c9855731a95e1" "599f72b66933ea8ba6fce3ae9e5e0b4e00311c2cbf01a6f46ac789227803dd96" "22a0d47fe2e6159e2f15449fcb90bbf2fe1940b185ff143995cc604ead1ea171" "456697e914823ee45365b843c89fbc79191fdbaff471b29aad9dcbe0ee1d5641" "83550d0386203f010fa42ad1af064a766cfec06fc2f42eb4f2d89ab646f3ac01" "5244ba0273a952a536e07abaad1fdf7c90d7ebb3647f36269c23bfd1cf20b0b8" "9b9d7a851a8e26f294e778e02c8df25c8a3b15170e6f9fd6965ac5f2544ef2a9" "166a2faa9dc5b5b3359f7a31a09127ebf7a7926562710367086fcc8fc72145da" "7de64ff2bb2f94d7679a7e9019e23c3bf1a6a04ba54341c36e7cf2d2e56e2bcc" "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19" "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" "9b55271bec4b2bae7eca6c96eac974b19f2f6d8cccc8fd34b30ab67220bb19d5" "db86c52e18460fe10e750759b9077333f9414ed456dc94473f9cf188b197bc74" "19a2c0b92a6aa1580f1be2deb7b8a8e3a4857b6c6ccf522d00547878837267e7" "3e374bb5eb46eb59dbd92578cae54b16de138bc2e8a31a2451bf6fdb0f3fd81b" "fa49766f2acb82e0097e7512ae4a1d6f4af4d6f4655a48170d0a00bcb7183970" "98b4ef49c451350c28a8c20c35c4d2def5d0b8e5abbc962da498c423598a1cdd" "2ff9ac386eac4dffd77a33e93b0c8236bb376c5a5df62e36d4bfa821d56e4e20" "72ed8b6bffe0bfa8d097810649fd57d2b598deef47c992920aef8b5d9599eefe" "b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d" "d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" "d41229b2ff1e9929d0ea3b4fde9ed4c1e0775993df9d998a3cdf37f2358d386b" "7b602fe4a324dc18877dde647eb6f2ff9352566ce16d0b888bfcb870d0abfd70" "fbf73690320aa26f8daffdd1210ef234ed1b0c59f3d001f342b9c0bbf49f531c" "712dda0818312c175a60d94ba676b404fc815f8c7e6c080c9b4061596c60a1db" "2e7dc2838b7941ab9cabaa3b6793286e5134f583c04bde2fba2f4e20f2617cf7" "a75aff58f0d5bbf230e5d1a02169ac2fbf45c930f816f3a21563304d5140d245" "937401a2e532f2c8c881b6b3f20d9d4b6b9405bccf72ea6289c9d3f4507eb1ab" "faf642d1511fb0cb9b8634b2070a097656bdb5d88522657370eeeb11baea4a1c" "0517759e6b71f4ad76d8d38b69c51a5c2f7196675d202e3c2507124980c3c2a3" "5a0ddbd75929d24f5ef34944d78789c6c3421aa943c15218bac791c199fc897d" "8363207a952efb78e917230f5a4d3326b2916c63237c1f61d7e5fe07def8d378" "f366d4bc6d14dcac2963d45df51956b2409a15b770ec2f6d730e73ce0ca5c8a7" "1114c56feb07fb44ad12ede602c566a1387aeffcf5990a446952d54fba620be3" "01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd" default))
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
