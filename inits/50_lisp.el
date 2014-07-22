;; ---------------------------------
;; Lisp general
;; Rainbow delimiters
(require 'rainbow-delimiters)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

(require 'smartparens-config)
(smartparens-global-mode t)


;; ---------------------------------
;; Scheme mode
;; Enable Quack mode
;; The binary of your interpreter
(setq scheme-program-name "mit-scheme-x86-64")
;; This hook lets you use your theme colours instead of quack's ones.
(defun scheme-mode-quack-hook ()
  (require 'quack)
  (setq quack-fontify-style 'emacs))
(add-hook 'scheme-mode-hook 'scheme-mode-quack-hook)


;; ---------------------------------
;; Gauche

(setq scheme-program-name "gosh")

(defun scheme-other-frame ()
    "Run scheme on other frame"
      (interactive)
        (switch-to-buffer-other-frame
            (get-buffer-create "*scheme*"))
          (run-scheme scheme-program-name))

(defun scheme-other-window ()
    "Run scheme on other window"
      (interactive)
        (switch-to-buffer-other-window
            (get-buffer-create "*scheme*"))
          (run-scheme scheme-program-name))

(defun gauche-info ()
    (interactive)
      (switch-to-buffer-other-frame
          (get-buffer-create "*info*"))
        (info
            "/usr/local/info/gauche-refj.info.gz"))

(define-key global-map
    "\C-xS" 'scheme-other-frame)

(define-key global-map
    "\C-cS" 'scheme-other-window)

(define-key global-map
    "\C-cI" 'gauche-info)


;; ;;; ---------------------------------
;; ;; SICP

;; (define true #t)
;; (define false #f)

;; ; 1.2節，問題3.5等で乱数を使う．使い方は下記URL参照
;; ; http://practical-scheme.net/wiliki/schemexref.cgi?SRFI-27
;; (use srfi-27)

;; ; 問題1.22
;; ; http://sicp.g.hatena.ne.jp/n-oohira/?word=*%5Bgauche%5D を参考にした
;; (define (runtime)
;;       (use srfi-11)
;;           (let-values (((a b) (sys-gettimeofday)))
;;                           (+ (* a 1000000) b)))

;; ; 2.2.1節
;; (define nil '())

;; ; 3.5節 遅延評価で使う
;; (define-macro (delay x) `(lambda () ,x))

;; ; 5章 レジスタ計算機で使う
;; (define user-initial-environment interaction-environment)
