;; ;; https://github.com/hlissner/doom-emacs/blob/develop/docs/faq.org#avoid-garbage-collection-at-startup

;; use ~/.emacs.d/init.el instead of ~/.emacs
;; emacs27 added support to xdg env vars, but for it to work ~/.emacs.d can't exist
(setq user-init-file "~/.config/emacs/init.el")


;; Added by Package.
(require 'package)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(setq package-enable-at-startup nil)
;; Allow loading from the package cache.
(setq package-quickstart t)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

;; package-initialize is unecessary on emacs 27
(when (< emacs-major-version 27)
  (package-initialize))

(server-start)

(define-key special-event-map [config-changed-event] 'ignore)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka Term" :foundry "CYEL" :slant normal :weight normal :height 90 :width normal))))
 '(org-block ((t (:inherit ## :background nil :foreground nil))))
 '(org-block-begin-line ((t (:inherit nil :background nil :foreground nil))))
 '(org-code ((t (:inherit nil :foreground nil))))
 '(org-document-info-keyword ((t (:inherit nil :foreground nil))))
 '(org-indent ((t (:inherit org-hide))))
 '(org-table ((t (:inherit nil :foreground nil))))
 '(org-verbatim ((t (:inherit nil :background nil :foreground nil))))
 '(whitespace-tab ((t (:foreground "#636363")))))

(put 'upcase-region 'disabled nil)

(if (file-exists-p (expand-file-name "~/emacs-config.el"))
    (load-file (expand-file-name "~/emacs-config.el"))
  (org-babel-load-file (expand-file-name "~/emacs-config.org")))

(insert (emacs-init-time))
