;;load-path
;;(setq load-path (cons "~/elisp/" load-path))

(add-to-list 'auto-mode-alist (cons "\\.tpl\\'" 'smarty-mode))
(autoload 'smarty-mode "smarty-mode" "Smarty Mode" t)

;;エスケープシーケンスを処理する
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
          "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;shell 補完機能
;;(add-hook 'shell-mode-hook 'pcomplete-shell-setup)
;;(load-library "tails-comint-history")



;;; バックアップファイルを作らない
(setq backup-inhibited t)
;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)

;;; 補完可能なものを随時表示
(icomplete-mode 1)

;;; カーソルの点滅を止める
(blink-cursor-mode 0)

;;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;;; カーソルの位置が何行目かを表示する
(line-number-mode t)


;;; 現在の関数名をモードラインに表示
(which-function-mode 1)

;;; 対応する括弧を光らせる。
(show-paren-mode 1)



(require 'recentf)
(setq recentf-auto-cleanup 'never) ;;tramp対策。
(recentf-mode 1)

;; 補完時に大文字小文字を区別しない
(setq eshell-cmpl-ignore-case t)
;; 確認なしでヒストリ保存
(setq eshell-ask-to-save-history (quote always))
;; 補完時にサイクルする
(setq eshell-cmpl-cycle-completions t)
;;補完候補がこの数値以下だとサイクルせずに候補表示
(setq eshell-cmpl-cycle-cutoff-length 5)
;; 履歴で重複を無視する
(setq eshell-hist-ignoredups t)

;; cuda
(setq auto-mode-alist
      (cons (cons "\\.cu$" 'c++-mode) auto-mode-alist))

;;texは euc-jp で開く
(add-to-list 'auto-coding-alist '("\\.tex$" . euc-jp))

;; 行数表示
(line-number-mode t)

;; スタートアップページを表示しない
(setq inhibit-startup-message t)

;; バックアップファイルを作らない
(setq backup-inhibited t)

;;対応する括弧を光らせたり
(show-paren-mode t)
(setq show-paren-style 'mixed)
(set-face-background 'show-paren-match-face "gray10")
(set-face-foreground 'show-paren-match-face "SkyBlue")


;;; 現在の関数名をモードラインに表示
(which-function-mode 1)

;;スクロールバーの位置を変える
(set-scroll-bar-mode nil) ;; なし



;;; キーバインド
(define-key global-map "\C-h" 'delete-backward-char) ; 削除
(define-key global-map "\C-c\C-f" 'recentf-open-files)   ; コメント
(define-key global-map "\C-c\C-c" 'comment-region)   ; コメント
(define-key global-map "\C-c\C-u" 'uncomment-region)   ; コメントアウト
(define-key mode-specific-map "c" 'compile) ;; C-c c で compile コマンドを呼び出す

(global-set-key "\C-z" 'undo)

;;;find-fileのファイル名補完で大文字小文字を区別しない設定
(setq completion-ignore-case t)

;;;補完可能なものを随時表示する
(icomplete-mode 1)

;;; 対応する括弧を光らせる。
(show-paren-mode 1)
;;; バーを消す
(tool-bar-mode 0)
(menu-bar-mode 0)

;;; タイトルバーにファイル名を表示する
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))
;;; 起動時に出てくる message を消したい
(setq inhibit-startup-message t)
;;;リンゴマークにMETAをバインディングさせたい
;;(setq mac-command-key-is-meta t)
;;;window 分割時、画面外に出る文章を折り返したい
(setq truncate-partial-width-windows nil)

(setq visible-bell t)

;; 補完時に大文字小文字を区別しない
(setq eshell-cmpl-ignore-case t)
;; 確認なしでヒストリ保存
(setq eshell-save-history-on-exit nil)
;; 補完時にサイクルする
(setq eshell-cmpl-cycle-completions t)
;;補完候補がこの数値以下だとサイクルせずに候補表示
(setq eshell-cmpl-cycle-cutoff-length 5)
;; 履歴で重複を無視する
(setq eshell-hist-ignoredups t)
(add-hook 'eshell-mode-hook
          '(lambda ()
             (progn
               (define-key eshell-mode-map "\C-a" 'eshell-bol)
               )
             ))

(require 'tramp)
(setq tramp-default-method "ssh")

;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-classic)

;;クリップボードの共有
(setq x-select-enable-clipboard t)

;;max full screen
(defun my-mac-toggle-max-window ()
  (interactive)
  (if (frame-parameter nil 'fullscreen)
      (set-frame-parameter nil 'fullscreen nil)
    (set-frame-parameter nil 'fullscreen 'fullboth)))

(setq transient-mark-mode t)

(setq shell-file-name "/bin/zsh")

(if window-system (progn
  (set-frame-parameter nil 'alpha 90)
))

(when (boundp 'show-trailing-whitespace)
  (setq-default show-trailing-whitespace t))

(setq mumamo-background-colors nil)
(add-to-list 'auto-mode-alist '("\\.twig$" . django-html-mumamo-mode))
(add-to-list 'auto-mode-alist '("\\.ctp$" . django-html-mumamo-mode))

(add-hook 'before-save-hook 'delete-trailing-whitespace)
