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

;;
;; Color
;;______________________________________________________________________

(set-foreground-color                                  "#FAFAFA") ; 文字色
(set-background-color                                  "#030303") ; 背景色
(set-cursor-color                                      "#22BBCC") ; カーソル色
(set-face-background 'region                           "#222244") ; リージョン
(set-face-foreground 'mode-line                        "#BBBBBB") ; モードライン文字
(set-face-background 'mode-line                        "#181818") ; モードライン背景
(set-face-foreground 'mode-line-inactive               "#000000") ; モードライン文字(非アクティブ)
(set-face-background 'mode-line-inactive               "#444444") ; モードライン背景(非アクティブ)
(set-face-foreground 'font-lock-comment-delimiter-face "#888899") ; コメントデリミタ
(set-face-foreground 'font-lock-comment-face           "#999999") ; コメント
(set-face-foreground 'font-lock-string-face            "#77DD99") ; 文字列
(set-face-foreground 'font-lock-function-name-face     "#88EEff") ; 関数名
(set-face-foreground 'font-lock-keyword-face           "#FF88aa") ; キーワード
(set-face-foreground 'font-lock-constant-face          "#FFaa77") ; 定数(this, selfなども)
(set-face-foreground 'font-lock-variable-name-face     "#44ddFF") ; 変数
(set-face-foreground 'font-lock-type-face              "#ffbb55") ; クラス
(set-face-foreground 'fringe                           "#555") ; fringe(折り返し記号なでが出る部分)
(set-face-background 'fringe                           "#202020") ; fringe

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
                    :foreground "#FAA"
                    :background "#000"
                    :height 0.9)

;; 行番号フォーマット
(setq linum-format "%4d")


;; タイトルバーにファイル名表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; カーソル行のハイライト
; http://murakan.cocolog-nifty.com/blog/2009/01/emacs-tips-1d45.html
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
