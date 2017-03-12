(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number-mode nil)
 '(org-time-clocksum-format
   (quote
    (:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; make clock history persistent across instance of emacs
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; initial window
(setq initial-frame-alist
      '(
        (width . 100) ; character
        (height . 54) ; lines
        ))

;; default/sebsequent window
(setq default-frame-alist
      '(
        (width . 100) ; character
        (height . 52) ; lines
        ))
