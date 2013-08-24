;;
;; encoding
;;______________________________________________________________________

(set-language-environment       "Japanese")
(set-terminal-coding-system     'utf-8-unix)
(set-keyboard-coding-system     'utf-8-unix)
(set-buffer-file-coding-system  'utf-8-unix)
(setq default-buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system           'utf-8-unix)
(setq default-coding-systems    'utf-8-unix)

; This code causes "text garble"
; (set-clipboard-coding-system    'utf-8-unix)
