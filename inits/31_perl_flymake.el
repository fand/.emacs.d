;; flymake for perl
(defvar flymake-perl-err-line-patterns '(("\(.*\) at \([^ n]+\) line \([0-9]+\)[,.n]" 2 3 nil 1)))
(defconst flymake-allowed-perl-file-name-masks '(("\.pl$" flymake-perl-init)
                                                 ("\.pm$" flymake-perl-init)
                                                 ("\.t$" flymake-perl-init)
                                                 ))

;; load set-perl5lib.el
(require 'set-perl5lib)

(defun flymake-perl-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "perl" (list "-wc" local-file))))

(defun flymake-perl-load ()
  (interactive)
  (set-perl5lib)
  (defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
    (setq flymake-check-was-interrupted t))
  (ad-activate 'flymake-post-syntax-check)
  (setq flymake-allowed-file-name-masks (append flymake-allowed-file-name-masks flymake-allowed-perl-file-name-masks))
  (setq flymake-err-line-patterns flymake-perl-err-line-patterns)
  (flymake-mode t))

(add-hook 'cperl-mode-hook '(lambda () (flymake-perl-load)))
;;(add-hook 'cperlmode-hook '(lambda () (flymake-mode t))) 

(defun next-flymake-error ()
  (interactive)
  (flymake-goto-next-error)
  (let ((err (get-char-property (point) 'help-echo)))
    (when err
      (message err))))
(global-set-key (kbd "C-c e") 'flymake-goto-next-error)
