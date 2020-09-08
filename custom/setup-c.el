;; company-c-headers
(use-package company-c-headers
  :init
  (add-to-list 'company-backends 'company-c-headers))

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'c-mode-common-hook 'function-args-mode)

;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode (see below)
;; “user”: When you want to define your own style
(setq c-default-style "stroustrup") ;; set style to "linux"

(use-package cc-mode
  :config
  (define-key c-mode-base-map  [(tab)] 'company-complete)
  (define-key c++-mode-map  [(tab)] 'company-complete))

(use-package lsp-mode
  :config
  (add-hook 'c++-mode-hook #'lsp)
  ;;(add-hook 'python-mode-hook #'lsp)
  ;;(add-hook 'rust-mode-hook #'lsp)
  (setq lsp-clients-clangd-args '("-j=4" "-background-index" "-log=error")))

(provide 'setup-c)
