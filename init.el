(require 'package)
(setq package-archives
;;         '(("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
;;         ("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
         '(("melpa" . "https://melpa.org/packages/")
         ("gnu" . "https://elpa.gnu.org/packages/")))
;;if use local mirrors uncomment it
;;(setq package-archives '(("myelpa" . "~/myelpa")))
(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(fset 'yes-or-no-p 'y-or-n-p)
(setq shell-file-name "/bin/bash")
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)

(global-set-key (kbd "C-c z") 'multi-term)
(global-set-key (kbd "<f10>") 'rename-buffer)

(when (fboundp 'winner-mode)
  (winner-mode)
  (windmove-default-keybindings))

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
;; (require 'setup-ggtags)
;;(require 'setup-cedet)
(require 'setup-c)
(require 'setup-editing)



;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (multi-term lsp-mode helm-ag projectile sr-speedbar function-args helm-smex magit evil-nerd-commenter evil-leader elpa-mirror company-c-headers smex zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
