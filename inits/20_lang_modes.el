;; for C++
(add-hook 'c++-mode-hook
          '(lambda()
             (c-set-style "stroustrup")
             (c-set-offset 'innamespace 0)   ; namespace {}はインデントしない
             (c-set-offset 'arglist-close 0) ; 関数の引数リストの閉じ括弧はインデントしない
             ))

;; scala-mode
(add-to-list 'load-path "~/.emacs.d/site-lisp/scala-mode")
(add-hook 'scala-mode-hook
          '(lambda ()
             (yas/minor-mode-on)))
(require 'scala-mode-auto)
(setq scala-interpreter "/opt/scala/bin/scala")

;; python jedi
;; (require 'jedi)
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:setup-keys t)
(add-hook 'python-mode-hook
          '(lambda ()
             (jedi:ac-setup)
             (define-key python-mode-map (kbd "<C-return>") 'jedi:complete)
             ))


;; emmet-mode
(require 'emmet-mode)
;;(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode) ;; CSSにも使う
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))) ;; indent はスペース2個
(eval-after-load "emmet-mode"
  '(define-key emmet-mode-keymap (kbd "C-j") nil)) ;; C-j は newline のままにしておく
(define-key emmet-mode-keymap (kbd "C-c C-m") 'emmet-expand-line)


;; markdown mode
(add-hook 'markdown-mode-hook
          '(lambda ()
             (remove-hook 'before-save-hook 'delete-trailing-whitespace)
             ))
