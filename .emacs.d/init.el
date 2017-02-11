
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "/usr/local/opt/cask/cask.el")
(cask-initialize)

(global-wakatime-mode)  


(define-key global-map "\C-h" 'delete-backward-char)


(add-to-list 'auto-mode-alist '("\\.dig\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'"  . markdown-mode))

(setq backup-inhibited t)
(setq delete-auto-save-files t)

(show-paren-mode 1)
(tool-bar-mode 0)
(menu-bar-mode 0)
