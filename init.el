;;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("gnu" . "https://elpa.gnu.org/packages/"))

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
;;(add-to-list 'package-pinned-packages '(magit . "melpa-stable") t)

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)


;;(unless (package-installed-p 'use-package)
;;  (package-refresh-contents)
;;  (package-install 'use-package))

;;(use-package cider
;;  :ensure t)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider

    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/navigation.el line 23 for a description
    ;; of ido
    ido-completing-read+

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; project navigation
    projectile

    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit

    ;; git integration
    ;;magit
    ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; THE BELOW PART IS JUST FOR EMACS CONFIG
;;____________________________________________________________

;; Don't show the splash screen
(setq inhibit-startup-message t ; Don't sow the splash screen
      visible-bell t)           ; Flash when the bell rings
;; This could also be:
;;(setq inhibit-startup-message t) ; Don't show the splash screen
;;(setq visible-bell t)            ; Flash when the bell rings

;; Turn off some unneeded UI elements
(menu-bar-mode -1)  ; Leave this one on if you're a beginner!
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Hightlight current line
(global-hl-line-mode t)

;; Display line numbers in every buffer
(global-display-line-numbers-mode 1)

;; load themes
(add-to-list 'load-path "~/.emacs.d/modus-themes")
(require 'modus-themes)
(load-theme 'modus-operandi t t)
(load-theme 'modus-vivendi t t)

(enable-theme 'modus-vivendi) ;; OR
;;(enable-theme 'modus-operandi)

;; If you're using Emacs 27, either install Modus themes or use this one!
;;(load-theme 'moduls-operandi)
