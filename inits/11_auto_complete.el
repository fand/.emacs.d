(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20130724.1750/dict/")

(ac-config-default)

(global-auto-complete-mode t)
;; 追加メジャーモード
(add-to-list 'ac-modes 'org-mode)

