;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jacek Kenig"
      user-mail-address "jacekkenig98@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)
;; fonts
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 18)
      doom-big-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 30)
      doom-variable-pitch-font (font-spec :family "Overpass Nerd Font" :size 18)
      doom-unicode-font (font-spec :family "JuliaMono")
      doom-serif-font (font-spec :family "DejaVu Serif" :weight 'light))


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/dox/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq
 display-line-numbers-type t
;; Don't replace the current window when splitting
 evil-split-window-below  t
 evil-vsplit-window-right t
 display-line-numbers-type 'relative
 org-roam-directory "~/dox/org/")

(defvar prvt/omitted-extensions '(".aux" ".bbl" ".blg" ".brf" ".dpth" ".auxlock"
                                  ".log" ".out" ".synctex.gz" ".dvi" ".md5")
  "Extensions that I never wanna see.")
;; Don't show latex junk files in dired
(after! dired-x
  (setq dired-omit-extensions (append dired-omit-extensions
                                      prvt/omitted-extensions)))

(setq counsel-find-file-ignore-regexp (concat "\\(?:^[#.]\\|?:[#~]$\\|?:^Icon?\\)"
                                              "\\|"
                                              (regexp-opt prvt/omitted-extensions)))

;;; Load other configs
(load! "splash")
;;(load! "latex-config")
;;(load! "org-config")
;;(load! "mu4e-config")
(when EMACS28+
  (load! "native-comp.el"))

(add-hook! 'nix-mode-hook (company-mode -1))

(custom-set-faces!
  '(doom-modeline-buffer-modified :foreground "orange"))

;; Silence compiler warnings as they can be pretty disruptive
(setq native-comp-async-report-warnings-errors nil)

;; Set the right directory to store the native comp cache
;; (add-to-list 'native-comp-eln-load-path (expand-file-name "eln-cache/" user-emacs-directory))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
