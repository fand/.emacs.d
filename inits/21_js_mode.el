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
(eval-after-load 'tern
  '(progn
     (add-hook 'js2-mode-hook 'tern-mode)
     (require 'tern-auto-complete)
     (tern-ac-setup)
     ;;(define-key tern-mode-keymap (kbd "C-\\") 'tern-ac-complete)
     (setq tern-ac-completion-truncate-length 30)
     ))

;; TypeScript mode
(add-hook 'typescript-mode-hook
          '(lambda ()
             (custom-set-variables '(typescript-indent-level 2))
             ))

;; (defun tern-ac-dot-complete ()
;;   "Insert dot and complete code at point by tern."
;;   (interactive)
;;   (insert ".")
;;   (tern-ac-complete))
