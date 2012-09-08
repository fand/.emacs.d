;; デフォルトディレクトリ

(let ((default-directory "~/.emacs.d/site-lisp/"))
  (setq load-path (cons default-directory load-path))
  (normal-top-level-add-subdirs-to-load-path))


;; sshでリモートファイル編集
(require 'tramp)


;;
;; encoding
;;______________________________________________________________________

(set-language-environment       "Japanese")
(prefer-coding-system           'utf-8-unix)
(setq                           default-buffer-file-coding-system 'utf-8)
(set-buffer-file-coding-system  'utf-8)
(set-terminal-coding-system     'utf-8)
(set-keyboard-coding-system     'utf-8)
(set-clipboard-coding-system    'utf-8)




;;
;; Window settings
;;______________________________________________________________________

(if window-system
    (progn
      (set-frame-parameter nil 'alpha 90) ; 透明度
      (tool-bar-mode nil)                  ; ツールバー非表示
      (menu-bar-mode nil)                  ; ツールバー非表示
      (set-scroll-bar-mode nil)            ; スクロールバー非表示
      (setq line-spacing 0.2)              ; 行間
      (when (>= emacs-major-version 23)
        (tool-bar-mode -1)
        (set-frame-font "IPAゴシック 10")
	(set-face-attribute 'default nil)
        (set-fontset-font (frame-parameter nil 'font)
                          'japanese-jisx0208
                          (font-spec :family "IPAゴシック" :size 12)))
      (setq ns-pop-up-frames nil)))

;;
;; Color
;;______________________________________________________________________

(set-foreground-color                                  "#EBEBEB") ; 文字色
(set-background-color                                  "#030303") ; 背景色
(set-cursor-color                                      "#CC2222") ; カーソル色
(set-face-background 'region                           "#222244") ; リージョン
(set-face-foreground 'modeline                         "#DDDDDD") ; モードライン文字
(set-face-background 'modeline                         "#333333") ; モードライン背景
(set-face-foreground 'mode-line-inactive               "#333333") ; モードライン文字(非アクティブ)
(set-face-background 'mode-line-inactive               "#DDDDDD") ; モードライン背景(非アクティブ)
(set-face-foreground 'font-lock-comment-delimiter-face "#888894") ; コメントデリミタ
(set-face-foreground 'font-lock-comment-face           "#888894") ; コメント
(set-face-foreground 'font-lock-string-face            "#77FF77") ; 文字列
(set-face-foreground 'font-lock-function-name-face     "#99efff") ; 関数名
(set-face-foreground 'font-lock-keyword-face           "#FF99BB") ; キーワード
(set-face-foreground 'font-lock-constant-face          "#FFBF77") ; 定数(this, selfなども)
(set-face-foreground 'font-lock-variable-name-face     "#44ddFF") ; 変数
(set-face-foreground 'font-lock-type-face              "#ffbb55") ; クラス
(set-face-foreground 'fringe                           "#666666") ; fringe(折り返し記号なでが出る部分)
(set-face-background 'fringe                           "#282828") ; fringe

(add-hook 'org-mode-hook
          '(lambda ()
             (set-face-foreground 'org-hide "#282828")))

(add-hook 'mmm-mode-hook
          '(lambda ()
             (set-face-background 'mmm-default-submode-face "#404040")))

(add-hook 'linum-mode-hook
          '(lambda ()
             (set-face-foreground 'linum "#666666")
             (set-face-background 'linum "#000000")))

;; 行番号表示
(global-linum-mode t)
(set-face-attribute 'linum nil
                    :foreground "#3aa"
		    :background "#222"
                    :height 0.9)

;; 行番号フォーマット
(setq linum-format "%4d")


;;
;; general key bind
;;______________________________________________________________________

(global-set-key (kbd "C-c a")   'align)
(global-set-key (kbd "C-c M-a") 'align-regexp)
(global-set-key (kbd "C-h")     'backward-delete-char)
(global-set-key (kbd "C-c d")   'delete-indentation)
(global-set-key (kbd "M-g")     'goto-line)
(global-set-key (kbd "C-S-i")   'indent-region)
(global-set-key (kbd "C-m")     'newline-and-indent)
(global-set-key (kbd "C-t")     'next-multiframe-window)
(global-set-key (kbd "M-<RET>") 'ns-toggle-fullscreen)
(global-set-key (kbd "C-S-t")   'previous-multiframe-window)
(global-set-key (kbd "C-M-r")   'replace-regexp)
(global-set-key (kbd "C-r")     'replace-string)
(global-set-key (kbd "C-/")     'undo)


;; C-c cでcompile
(define-key mode-specific-map "c" 'compile)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


(setq inhibit-startup-screen t)
;; (setq inhibit-startup-message t) 
(setq initial-scratch-message "")

;; タブをスペースにする設定
(setq-default indent-tabs-mode nil)
(custom-set-variables '(tab-width 4))

;; タイトルバーにファイル名表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))


;; バックアップファイルを作らない
(setq make-backup-files nil)







;; js2-mode

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))



;; scala-mode
(add-to-list 'load-path "~/.emacs.d/site-lisp/scala-mode")
(add-hook 'scala-mode-hook
          '(lambda ()
             (yas/minor-mode-on)))
;(setq yas/scala "~/.emacs.d/site-lisp/scala-mode/contrib/yasnippet/snippets")
;(yas/load-directory yas/scala)
(require 'scala-mode-auto)
(setq scala-interpreter "/opt/scala/bin/scala")
