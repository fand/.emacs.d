(defvar ac-source-my-perl-completion
  '((candidates . plcmp-ac-make-cands)))

(add-hook 'cperl-mode-hook
          (lambda()
            (setq plcmp-use-keymap nil)
            (require 'perl-completion)
            (perl-completion-mode t)
            (add-to-list 'ac-sources 'ac-source-my-perl-completion)
            (local-set-key (kbd "M-RET") 'plcmp-cmd-smart-complete)
            (local-set-key (kbd "C-c d") 'plcmp-cmd-show-doc-at-point)
            ))
