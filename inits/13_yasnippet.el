(require 'yasnippet)

(require 'dropdown-list)
(setq yas/text-popup-function #'yas/dropdown-list-popup-for-template)

;; コメントやリテラルではスニペットを展開しない
(setq yas/buffer-local-condition
      '(or (not (or (string= "font-lock-comment-face"
                             (get-char-property (point) 'face))
                    (string= "font-lock-string-face"
                             (get-char-property (point) 'face))))
           '(require-snippet-condition . force-in-comment)))

;; yasnippet 公式提供のものと、
;; 自分用カスタマイズスニペットをロード同名のスニペットが複数ある場合、
;; あとから読みこんだ自分用のものが優先される。
;; また、スニペットを変更、追加した場合、
;; このコマンドを実行することで、変更・追加が反映される。
(defun yas/load-all-directories ()
  (interactive)
  (yas/reload-all)
  (mapc 'yas/load-directory my-snippet-directories))
;;; yasnippet展開中はflymakeを無効にする
(defvar flymake-is-active-flag nil)
(defadvice yas/expand-snippet
  (before inhibit-flymake-syntax-checking-while-expanding-snippet activate)
  (setq flymake-is-active-flag
        (or flymake-is-active-flag
            (assoc-default 'flymake-mode (buffer-local-variables))))
  (when flymake-is-active-flag
    (flymake-mode-off)))
(add-hook 'yas/after-exit-snippet-hook
          '(lambda ()
             (when flymake-is-active-flag
               (flymake-mode-on)
               (setq flymake-is-active-flag nil))))

(setq yas/root-directory (expand-file-name "~/.emacs.d/snippets"))

;; 自分用スニペットディレクトリ(リストで複数指定可)
(defvar my-snippet-directories
  (list (expand-file-name "~/.emacs.d/snippets")))

;;(yas/initialize)
(yas--initialize)
(yas/load-directory "~/.emacs.d/snippets")
(yas/load-all-directories)

;; 問い合わせを簡略化 yes/no を y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; ~/.emacs.d/にsnippetsというフォルダを作っておきましょう
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets" ;; 作成するスニペットはここに入る
        ;;"~/.emacs.d/elisp/yasnippet/snippets" ;; 最初から入っていたスニペット(省略可能)
        ))
(yas-global-mode 1)

;; 単語展開キーバインド (ver8.0から明記しないと機能しない)
;; (setqだとtermなどで干渉問題ありでした)
;; もちろんTAB以外でもOK 例えば "C-;"とか
;;(custom-set-variables '(yas-trigger-key (kbd "TAB")))
(custom-set-variables '(yas-trigger-key "C-x C-y"))

;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)
