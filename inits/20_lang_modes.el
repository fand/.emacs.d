;; for C++
(add-hook 'c++-mode-hook
          '(lambda()
             (c-set-style "stroustrup")
             (c-set-offset 'innamespace 0)   ; namespace {}はインデントしない
             (c-set-offset 'arglist-close 0) ; 関数の引数リストの閉じ括弧はインデントしない
             ))

;; js2-mode
(autoload 'js2-mode "js2-mode.el" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

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

