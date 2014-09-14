(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20130724.1750/dict/")

(ac-config-default)

(global-auto-complete-mode t)
;; 追加メジャーモード
(add-to-list 'ac-modes 'org-mode)

(define-key ac-mode-map (kbd "C-\\") 'auto-complete)


;; 7.5. 補完メニュー表示時のみC-n/C-pで補完候補を選択する
(setq ac-use-menu-map t)
;; デフォルトで設定済み
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

;; 大文字・小文字を区別しない
(setq ac-ignore-case t)

;; 20行分表示
(setq ac-menu-height 20)
