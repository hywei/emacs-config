(require 'package)
(setq package-archives '(("gnu"     . "http://elpa.emacs-china.org/gnu/")
                         ("melpa"    . "http://elpa.emacs-china.org/melpa/")))

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(add-to-list 'load-path "~/.emacs.d/custom")
(add-to-list 'load-path "~/.emacs.d/elisps")

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
;; (require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)
(require 'setup-c)


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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (material)))
 '(custom-safe-themes
   (quote
    ("98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" default)))
 '(package-selected-packages
   (quote
    (jinja2-mode
     afternoon-theme
     grandshell-theme
     subatomic-theme
     subatomic256-theme
     color-theme-sanityinc-solarized
     color-theme-sanityinc-tomorrow
     color-theme-solarized
     cyberpunk-theme
     material-theme
     ujelly-theme
     rebecca-theme
     plan9-theme
     github-theme
     eink-theme
     ample-theme
     ahungry-theme
     yaml-tomato
     yaml-mode
     zygospore
     helm-gtags
     helm
     yasnippet
     ws-butler
     volatile-highlights
     use-package
     undo-tree
     iedit
     dtrt-indent
     counsel-projectile
     company
     clean-aindent-mode
     anzu)))
 '(tool-bar-mode nil))

;; lua mode
(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t
      version-control t
      delete-old-versions t
      kept-new-versions 20
      kept-old-versions 5)


;; make whitespace-mode use just basic coloring
(setq whitespace-display-mappings
      ;; all numbers are Unicode codepoint in decimal. .: (insert-char 182 1)
      '(
        (space-mark 32 [183] [46]) ; 32 SPACE 183 MIDDLE DOT 46 FULL STOP
        ;(newline-mark 10 [182 10]) ; 10 LINE FEED
        (tab-mark 9 [9655 9] [92 9]); 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE
        ))


(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
