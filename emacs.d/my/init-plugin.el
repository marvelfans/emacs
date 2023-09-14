;; Comment
;; 插件配置文件



(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(use-package go-mode
  ;; support go
  :ensure t
  :defer 1
  :mode "\\.go\\'"
  :init (add-hook 'before-save-hook #'gofmt-before-save))

(use-package swiper
  ;; comment: for ivy
  :ensure t
  :defer 1)

(use-package counsel
  :ensure t
  :defer 1)

(use-package ivy-file-preview
  ;; comment: for ivy
  :ensure t
  :defer 1)

(use-package ivy
  :ensure t
  :defer 1
  :bind (("C-s" . swiper-isearch)
         ("C-r" . swiper-isearch-backward)
         ("C-x C-f" . counsel-find-file)
         ("C-x b" . ivy-switch-buffer)
         ("C-M-j" . ivy-immediate-done))
  :init (setq ivy-count-format "(%d/%d) "
              ivy-use-virtual-buffers t
              enable-recursive-minibuffers t)
  :config (ivy-mode 1))

(use-package company
  :ensure t
  :defer 1
  :commands company-mode
  :init (setq company-minimum-prefix-length 1
              company-tooltip-align-annotations t
              company-idle-delay 0.0
              company-show-numbers t
              company-selection-wrap-around t)
  :hook ((prog-mode . company-mode)
         (text-mode . company-mode)
         (c-mode-hook . company-mode)
         (c++-mode-hook . company-mode)))

(use-package gruvbox-theme
  ;; color theme
  :ensure t
  :config (load-theme 'gruvbox-dark-hard t))


(use-package hl-todo
  ;; highlight TODO keywords
  :ensure t
  :config (global-hl-todo-mode t))


(use-package rust-mode
  ;; rust mode
  :ensure t
  :mode "\\.rs\\'"
  :init (setq rust-format-on-save t))


(use-package projectile
  :ensure t
  :init          (projectile-mode +1)
  :config (setq projectile-project-search-path '(("~/go/src/" . 2) "~/Documents/src/"))
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map)))



;;;;;;;;;;;;;;;;;;;
(provide 'init-plugin)