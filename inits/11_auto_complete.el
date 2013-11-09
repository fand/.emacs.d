(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20130724.1750/dict/")
(ac-config-default)
(global-auto-complete-mode t)
(add-to-list 'ac-modes 'org-mode)


(setq ac-delay 0.001)
(setq ac-auto-show-menu 0.1)
(setq ac-use-menu-map t)
(setq ac-use-fuzzy t)

