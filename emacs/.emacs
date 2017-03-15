;; Popular repos for packages
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(setq c-default-style "linux"
      c-basic-offset 2)

;; make clock history persistent across instance of emacs
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; colorscheme
(require 'solarized)
(load-theme'solarized-dark t)

;; paragraph filling/word wrapping
(setq-default fill-column 80)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'c++-mode-hook 'turn-on-auto-fill)
(add-hook 'c-mode-hook 'turn-on-auto-fill)
(global-set-key (kbd "C-c q") 'auto-fill-mode)

;; evil-mode
(setq evil-want-C-u-scroll t) ;; to allow Ctrl-u scrolling
(require 'evil)
(evil-mode t)

;; initial window
(setq initial-frame-alist
      '(
        (width . 120) ; character
        (height . 60) ; lines
        ))

;; default/sebsequent window
(setq default-frame-alist
      '(
        (width . 120) ; character
        (height . 58) ; lines
        ))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(initial-buffer-choice "/path/to/default/file/to/open")
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(flymake-google-cpplint-command "/usr/local/bin/cpplint")
 '(package-selected-packages
   (quote
    (cedit flymake-cursor google-c-style flymake-google-cpplint auto-complete-c-headers auto-complete yasnippet ## evil-org evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; evil-org-mode
(add-to-list 'load-path "~/.emacs.d/plugins/evil-org-mode")
(require 'evil-org)

;; for exporting
(require 'ox-md)

;; find the corresponding file .h/.cpp/* file
(global-set-key (kbd "C-x C-o") 'ff-find-other-file)

;; gtags
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))
(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

;; evil-surround
(require 'evil-surround)
(global-evil-surround-mode 1)
(add-hook 'c++-mode-hook (lambda ()
                           (push '(?< . ("< " . " >")) evil-surround-pairs-alist)))


;; evil-magit
;; optional: this is the evil state that evil-magit will use
;; (setq evil-magit-state 'normal)
;; optional: disable additional bindings for yanking text
;; (setq evil-magit-use-y-for-yank nil)
(require 'evil-magit)


;; yasnippets
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; auto-complete
(ac-config-default)

;; auto-complete-c-headers
;; ex. adding include directories
;;   (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/usr/llvm-gcc-4.2/lib/gcc/i686-apple-darwin11/4.2.1/include")
(defun my:ac-c-headers-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
)

(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)

;; iedit
(require 'iedit)

;; google-cpplint
;;(defun my:flymake-google-init ()
;;  (require 'flymake-google-cpplint)
;;  (custom-set-variables
;;   '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
;;  (flymake-google-cpplint-load)
;; )
;;(add-hook 'c++-mode-hook 'my:flymake-google-init)
;;(add-hook 'c-mode-hook 'my:flymake-google-init)


;; setup support for doxygen color highlighting
(defun my-cc-init-hook ()
  "Initialization hook for CC-mode runs before any other hooks."
  (setq c-doc-comment-style
    '((java-mode . javadoc)
      (pike-mode . autodoc)
      (c-mode    . javadoc)
      (c++-mode  . javadoc)))
  (set-face-foreground 'font-lock-doc-face
               (face-foreground font-lock-comment-face)))
(add-hook 'c-initialization-hook 'my-cc-init-hook)

;; irony
(require 'irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
;;(defun my-irony-mode-hook ()
;;  (define-key irony-mode-map [remap completion-at-point]
;;    'irony-completion-at-point-async)
;;  (define-key irony-mode-map [remap complete-symbol]
;;    'irony-completion-at-point-async))
;;(add-hook 'irony-mode-hook 'my-irony-mode-hook)
;;(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
