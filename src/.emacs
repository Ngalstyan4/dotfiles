;=======================================================================
; .emacs: The Emacs initialization file.
; Emacs executes this file whenever it is launched.
;=======================================================================

; Create (or don't create) backup files.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq-default make-backup-files t)
; (setq-default make-backup-files nil)

;-----------------------------------------------------------------------

; Set the indentation style for C code.
(setq c-default-style "ellemtel")
; (setq c-default-style "cc-mode")
; (setq c-default-style "gnu")
; (setq c-default-style "k&r")
; (setq c-default-style "bsd")
; (setq c-default-style "stroustrup")

;-----------------------------------------------------------------------

; Display (or don't display) trailing whitespace characters using an
; unusual background color so they are visible.
; (setq-default show-trailing-whitespace t)
(setq-default show-trailing-whitespace nil)

;-----------------------------------------------------------------------

; Set the "Control-x w" key sequence to call the function
; "delete-trailing-whitespace".
(global-set-key "\C-xw" 'delete-trailing-whitespace)

;-----------------------------------------------------------------------

; Turn on (or off) syntax highlighting.
(global-font-lock-mode t)
; (global-font-lock-mode nil)

;-----------------------------------------------------------------------

; Display (or don't display) the column number in the status bar.
(setq column-number-mode t)
; (setq column-number-mode nil)

;-----------------------------------------------------------------------

; Highlight (or don't highlight) the region bounded by the mark and
; the point.
(setq transient-mark-mode t)
; (setq transient-mark-mode nil)

;-----------------------------------------------------------------------

; Highlight (or don't highlight) matching parentheses, braces, and
; brackets.
(show-paren-mode t)
; (show-paren-mode nil)

;-----------------------------------------------------------------------

; Bind the "Control-x l" (the letter "ell") key sequence to
; the function "goto-line".
(global-set-key "\C-xl" 'goto-line)

;-----------------------------------------------------------------------

; Bind the Home and End keys for PuTTY.
(global-set-key "\C-[[1~" 'beginning-of-line)
(global-set-key "\C-[[4~" 'end-of-line)

; Bind the Home and End keys for the Linux GNOME Terminal.
(global-set-key "\C-[OH" 'beginning-of-line)
(global-set-key "\C-[OF" 'end-of-line)

;-----------------------------------------------------------------------

; Set the comment character for asm-mode to '#'.
(setq asm-comment-char ?#)

;-----------------------------------------------------------------------

; Indent using spaces instead of tabs, but not in makefile-mode.
(defun myIndentUsingSpaces () (setq indent-tabs-mode nil))
(add-hook 'text-mode-hook 'myIndentUsingSpaces)
(add-hook 'c-mode-hook 'myIndentUsingSpaces)
(add-hook 'asm-mode-hook 'myIndentUsingSpaces)
(add-hook 'java-mode-hook 'myIndentUsingSpaces)
(add-hook 'python-mode-hook 'myIndentUsingSpaces)
(add-hook 'emacs-lisp-mode-hook 'myIndentUsingSpaces)

;-----------------------------------------------------------------------

; When using an X-Window System server, make the scroll bar appear
; on the right (or left).
(set-scroll-bar-mode `right)
; (set-scroll-bar-mode `left)

;-----------------------------------------------------------------------

; Make the Control-n and Control-p keys (and the down arrow and up
; arrow keys) scroll the current window one line at a time instead
; of one-half screen at a time.
(setq scroll-step 1)

;-----------------------------------------------------------------------

; Bind the "Control-x p" key sequence to the function "indent-all".
; The "indent-all" function indents all lines of the C program in the
; current buffer according to the selected indentation style.
(defun indent-all()
   (interactive)
   (save-excursion
      (let ()
         (goto-char (point-min))
         (while (< (point) (point-max))
            (c-indent-command)
            (next-line 1))))
   (delete-trailing-whitespace))
(global-set-key "\C-xp" 'indent-all)

;-----------------------------------------------------------------------

; Tell Emacs where to find plug-in (.el) files.
(setq load-path (cons "~cos217/lib" load-path))

;-----------------------------------------------------------------------

; Bind the "Control-x n" key sequence to call the function "linum-mode",
; thus toggling line numbering.
(require 'linum)
(global-set-key "\C-xn" 'linum-mode)
; (defun mySetLinumMode () (interactive) (linum-mode 1))
; (add-hook 'text-mode-hook 'mySetLinumMode)
; (add-hook 'c-mode-hook 'mySetLinumMode)
; (add-hook 'asm-mode-hook 'mySetLinumMode)
; (add-hook 'java-mode-hook 'mySetLinumMode)
; (add-hook 'python-mode-hook 'mySetLinumMode)
; (add-hook 'emacs-lisp-mode-hook 'mySetLinumMode)
; (add-hook 'makefile-mode-hook 'mySetLinumMode)

;-----------------------------------------------------------------------


;-----------------------------------------------------------------------

; Define gdb as an alias for gud-gdb. See the emacs manual for details.
(defalias 'gdb 'gud-gdb)

;-----------------------------------------------------------------------

; Added by emacs.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (racer rustic rust-mode sql-indent neotree fsharp-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(col-highlight ((t (:background "color-233"))))
 '(hl-line ((t (:background "color-233"))))
 '(lazy-highlight ((t (:background "black" :foreground "white" :underline t))))
 '(neo-dir-link-face ((t (:foreground "cyan"))))
 '(neo-file-link-face ((t (:foreground "white")))))
(setq global-linum-mode t)
(setq x-select-enable-clipboard t)


;; ;-----------------------------------------------------------------------
;; ; OCaml Stuffff
;; ;-----------------------------------------------------------------------

;; ; tuareg setup
;; (load "/Users/ngalstyan/.opam/system/share/emacs/site-lisp/tuareg-site-file")

;; ; merlin setup
;; (let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
;;       (when (and opam-share (file-directory-p opam-share))
;;        ;; Register Merlin
;;        (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
;;        (autoload 'merlin-mode "merlin" nil t nil)
;;        ;; Automatically start it in OCaml buffers
;;        (add-hook 'tuareg-mode-hook 'merlin-mode t)
;;        (add-hook 'caml-mode-hook 'merlin-mode t)
;;        ;; Use opam switch to lookup ocamlmerlin binary
;;        (setq merlin-command 'opam)))


;; ; Ocaml ocp-index
;; (add-to-list 'load-path "/Users/ngalstyan/.opam/system/share/emacs/site-lisp")
;; (require 'ocp-index)

;; (add-to-list 'load-path "/Users/ngalstyan/.opam/system/share/emacs/site-lisp")
;; (require 'ocp-indent)

;-----------------------------------------------------------------------

;------ add melpa to install fsharp mode
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))


;------ neotree for emacs: show dir structure on click f8
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))


                                        ;--- sql indent
(eval-after-load "sql"
      (load-library "sql-indent"))



;-----------------------------------------------------------------------
; Rust Stuffff
;-----------------------------------------------------------------------

; Rust racer
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

; keyboard shortcuts
(add-hook 'rust-mode-hook(lambda ()(local-set-key "\C-d" (quote racer-find-definition-other-window))))
(add-hook 'rust-mode-hook(lambda ()(local-set-key "\C-x." (quote racer-find-definition))))
(add-hook 'rust-mode-hook(lambda ()(local-set-key "\C-x," (quote pop-tag-mark))))
