;; デフォルトディレクトリ
(let ((default-directory "~/.emacs.d/site-lisp/"))
  (setq load-path (cons default-directory load-path))
  (normal-top-level-add-subdirs-to-load-path)
)

;; init-loader
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits/") ; 設定ファイルがあるディレクトリを指定

;; タブをスペースにする設定
(setq-default indent-tabs-mode nil)
(custom-set-variables '(tab-width 4))

;; バックアップファイルを作らない
(setq make-backup-files nil)

;; flymake
(require 'flymake)
