;; js2-mode
(autoload 'js2-mode "js2-mode.el" nil t)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook 'ac-js2-mode)
(add-hook 'js2-mode-hook
          #'(lambda ()
              (setq js2-basic-offset 2
                    indent-tabs-mode nil)
              ))

;; tern
(add-hook 'js2-mode-hook 'tern-mode)
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)
     (define-key ac-mode-map (kbd "C-\\") 'ac-start)
     (setq tern-ac-completion-truncate-length 30)
     ))

;; TypeScript mode
(add-hook 'typescript-mode-hook
          '(lambda ()
             (custom-set-variables '(typescript-indent-level 2))
             ))
