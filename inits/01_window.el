;;
;; Window settings
;;______________________________________________________________________

(if window-system
    (progn
      (set-frame-parameter nil 'alpha 85) ; 透明度
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


(tool-bar-mode -1)
(menu-bar-mode -1)
(setq locale-coding-system 'utf-8)

(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/elisp/themes/"))

(set-face-attribute 'default nil
                    :family "Monaco"
                    :height 120)

(set-fontset-font "fontset-default"
                  'japanese-jisx0208
                  '("Hiragino Kaku Gothic Pro"))

(set-fontset-font "fontset-default"
                  'katakana-jisx0201
                  '("Hiragino Kaku Gothic Pro"))


;;
;; Color
;;______________________________________________________________________

;; (load-theme 'charcoal-black t t)
;; (enable-theme 'charcoal-black)
;; (load-theme 'desert t t)
;; (enable-theme 'desert)
;; (load-theme 'ld-dark t t)
;; (enable-theme 'ld-dark)
;; (load-theme 'solarized-dark t)


(set-foreground-color                                  "#ddeeFF") ; 文字色
(set-background-color                                  "#010101") ; 背景色
(set-cursor-color                                      "#22BBCC") ; カーソル色
(set-face-foreground 'region                           "#222222") ; リージョン
(set-face-background 'region                           "#44ccff") ; リージョン
(set-face-foreground 'mode-line                        "#222222") ; モードライン文字
(set-face-background 'mode-line                        "#99eeff") ; モードライン背景
(set-face-foreground 'mode-line-inactive               "#888888") ; モードライン文字(非アクティブ)
(set-face-background 'mode-line-inactive               "#000000") ; モードライン背景(非アクティブ)
(set-face-foreground 'font-lock-comment-delimiter-face "#555555") ; コメントデリミタ
(set-face-foreground 'font-lock-comment-face           "#777777") ; コメント
(set-face-foreground 'font-lock-string-face            "#77DD99") ; 文字列
(set-face-foreground 'font-lock-function-name-face     "#77ddff") ; 関数名
(set-face-foreground 'font-lock-keyword-face           "#FF77aa") ; キーワード
(set-face-foreground 'font-lock-constant-face          "#FFaa77") ; 定数(this, selfなども)
(set-face-foreground 'font-lock-variable-name-face     "#44ffdd") ; 変数
(set-face-foreground 'font-lock-type-face              "#ffbb44") ; クラス
(set-face-foreground 'fringe                           "#555555") ; fringe(折り返し記号なでが出る部分)
(set-face-background 'fringe                           "#202020") ; fringe

(add-hook 'org-mode-hook
          '(lambda ()
             (set-face-foreground 'org-hide "#282828")))

(add-hook 'mmm-mode-hook
          '(lambda ()
             (set-face-background 'mmm-default-submode-face "#404040")))

;; (add-hook 'linum-mode-hook
;;           '(lambda ()
;;              (set-face-foreground 'linum "#666666")
;;              (set-face-background 'linum "#000000")))

;; 行番号表示
(global-linum-mode t)
(set-face-attribute 'linum nil
                    :foreground "#444"
                    :background "#080808"
                    :height 0.1)

;; 行番号フォーマット
(setq linum-format "%4d ")


;; タイトルバーにファイル名表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; カーソル行のハイライト
;; http://murakan.cocolog-nifty.com/blog/2009/01/emacs-tips-1d45.html
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "#222"))
    (((class color)
      (background light))
     (:background "#000"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
;; (setq hl-line-face 'underline) ; 下線
(global-hl-line-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; pane3bunkatu
;; http://d.hatena.ne.jp/yascentur/20110621/1308585547

(defun split-window-vertically-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-vertically)
    (progn
      (split-window-vertically
       (- (window-height) (/ (window-height) num_wins)))
      (split-window-vertically-n (- num_wins 1)))))
(defun split-window-horizontally-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-horizontally)
    (progn
      (split-window-horizontally
       (- (window-width) (/ (window-width) num_wins)))
      (split-window-horizontally-n (- num_wins 1)))))
(global-set-key (kbd "\C-x \C-v") '(lambda ()
                                     (interactive)
                                     (split-window-vertically-n 3)))
(global-set-key (kbd "\C-x \C-h") '(lambda ()
                                     (interactive)
                                     (split-window-horizontally-n 3)))
