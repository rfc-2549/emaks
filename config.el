(setq name "qorg11")
(setq email "qorg@vxempire.xyz")

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer.
Including indent-buffer, which should not be called automatically on save."
  (interactive)
  (untabify-buffer)
  (delete-trailing-whitespace)
  (indent-buffer))

(global-set-key (kbd "C-c n") 'cleanup-buffer)
(global-set-key (kbd "M-m") 'mark-whole-buffer)

(setq package-enable-at-startup nil) (package-initialize)

(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(put 'upcase-region 'disabled nil)


(defun contextual-menubar (&optional frame)
"Display the menubar in FRAME (default: selected frame) if on a
graphical display, but hide it if in terminal."
(interactive)
(set-frame-parameter frame 'menu-bar-lines
(if (display-graphic-p frame)
1 0)))

(add-hook 'after-make-frame-functions 'contextual-menubar)
(add-hook 'sgml-mode-hook 'zencoding-mode)
(setq-default dired-details-hidden-string "---- ")

;; (icomplete-mode 1) Deprecated, used ido-mode instead

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(set-frame-font "IBM Plex Mono 14" nil t)
  (load-file "~/.emacs.d/markup.el")
    (global-set-key (kbd "M-x") 'smex)


  (setq-default major-mode 'text-mode)

(defadvice smex (around space-inserts-hyphen activate compile)

(let ((ido-cannot-complete-command
`(lambda ()
(interactive)
(if (string= " " (this-command-keys))
(insert ?-)
(funcall ,ido-cannot-complete-command)))))
ad-do-it))

(show-paren-mode 1)
 (setq show-paren-style 'mixed)

 (setq startup/gc-cons-threshold gc-cons-threshold)
 (setq gc-cons-threshold most-positive-fixnum)
 (defun startup/reset-gc () (setq gc-cons-threshold startup/gc-cons-threshold))
 (add-hook 'emacs-startup-hook 'startup/reset-gc)

(defun open-pdf()
   (interactive)
   (setq file (buffer-substring (mark) (point)))
   (shell-command (concat "zathura " file "&")
   ))
   ;; Borders
   (set-face-attribute 'fringe nil
   :foreground (face-foreground 'default)
   :background (face-background 'default))

(add-hook 'org-mode-hook 'org-bullets-mode)
(setq org-hide-emphasis-markers t)

(use-package linum-relative
:ensure t
:init
(setq-default display-line-numbers-type 'relative
display-line-numbers-current-relative t
display-line-numbers-width 1
display-line-numbers-widen t)

(add-hook 'text-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(column-number-mode 1))

(use-package flycheck
:ensure t
:init
(add-hook 'after-init-hook #'global-flycheck-mode))

(use-package zerodark-theme
:ensure t
:config
(load-theme 'zerodark t))

(setq erc-nick name)

(with-eval-after-load 'tex
  (setq TeX-source-correlate-method 'synctex)
  (TeX-source-correlate-mode)
  (setq TeX-source-correlate-start-server t)

  (add-to-list 'TeX-view-program-selection
               '(output-pdf "Zathura")))

(setq shell "/bin/bash")
 (defadvice ansi-term (before force-bsah)
(interactive (list shell)))
(ad-activate 'ansi-term)

(use-package ido-vertical-mode
 :ensure t
 :init
(setq ido-enable-flex-matching nil)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer))

(use-package dashboard
:ensure t
:init
(dashboard-setup-startup-hook)
(setq dashboard-items '((recents  . 5)
(bookmarks . 5)))
(setq dashboard-startup-banner 'logo)
(setq dashboard-banner-logo-title "Welcome to Editor MACroS")

(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t))

(use-package powerline
:ensure t
:init
(powerline-default-theme)

    (set-face-background 'mode-line
    "#080c0d")
    (set-face-foreground 'mode-line
    "#cad5d8"))
