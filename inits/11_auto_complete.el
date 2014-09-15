(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20130724.1750/dict/")

(ac-config-default)

(global-auto-complete-mode t)
;; 追加メジャーモード
(add-to-list 'ac-modes 'org-mode)

;;(define-key ac-mode-map (kbd "C-\\") 'auto-complete)
;;(setq ac-auto-show-menu 2)
(ac-set-trigger-key "C-\\")


(setq ac-ignore-case t)
;; 7.5. 補完メニュー表示時のみC-n/C-pで補完候補を選択する
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)



(setq ac-delay 0.05)  ;; n秒後に補完開始
(setq ac-use-fuzzy t)  ;; 曖昧マッチ有効
(setq ac-use-comphist t)  ;; 補完推測機能有効
(setq ac-auto-show-menu 0.05)  ;; n秒後に補完メニューを表示
(setq ac-quick-help-delay 0.5)  ;; n秒後にクイックヘルプを表示
(setq ac-ignore-case t)  ;; 大文字・小文字を区別する

;; 表示設定
(setq ac-menu-height 20)  ;; 20行分表示
(set-face-background 'ac-candidate-face "#44444d")
(set-face-foreground 'ac-candidate-face "#eeeeee")
(set-face-underline  'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "#abcdef")
(set-face-foreground 'ac-selection-face "#000000")
(set-face-background 'popup-summary-face "#44444d")  ;; 候補のサマリー部分
(set-face-foreground 'popup-summary-face "#aaccff")
(set-face-background 'popup-tip-face     "#444466")   ;; ドキュメント部分
(set-face-foreground 'popup-tip-face     "#ffffff")
