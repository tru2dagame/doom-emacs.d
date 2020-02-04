;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*Doom%20default%20config][Doom default config:1]]
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!

;; Key Configuration for Doom as Vanilla Emacs
(setq evil-default-state 'emacs)

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Tru"
      user-mail-address "tru.zhou@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Operator Mono SSm" :size 20))


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-one)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/Dropbox/Org")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type t)
;; Doom default config:1 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*Frame%20size][Frame size:1]]
;; Set initial frame size and position
(defun my/set-initial-frame ()
  (let* ((base-factor 0.81)
	(a-width (* (display-pixel-width) base-factor))
        (a-height (* (display-pixel-height) base-factor))
        (a-left (truncate (/ (- (display-pixel-width) a-width) 2)))
	(a-top (truncate (/ (- (display-pixel-height) a-height) 2))))
    (set-frame-position (selected-frame) a-left a-top)
    (set-frame-size (selected-frame) (truncate a-width)  (truncate a-height) t)))
(setq frame-resize-pixelwise t)
(my/set-initial-frame)
;; Frame size:1 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*Define%20const%20=is-a-mac=][Define const =is-a-mac=:1]]
(defconst *is-a-mac* (eq system-type 'darwin))
;; Define const =is-a-mac=:1 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*Quickly%20visit%20Emacs%20configuration][Quickly visit Emacs configuration:1]]
(defun tru/visit-emacs-config ()
  (interactive)
  (find-file "/Users/tru/Dropbox/Apps/emacs/tru/doom-emacs/config.org"))
(global-set-key (kbd "ESC ESC e") 'tru/visit-emacs-config)
;; Quickly visit Emacs configuration:1 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*macOS%20keybinding][macOS keybinding:1]]
(when *is-a-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super)
  ;; Make mouse wheel / trackpad scrolling less jerky
  (setq mouse-wheel-scroll-amount '(1
                                    ((shift) . 5)
                                    ((control))))
  (dolist (multiple '("" "double-" "triple-"))
    (dolist (direction '("right" "left"))
      (global-set-key (read-kbd-macro (concat "<" multiple "wheel-" direction ">")) 'ignore)))
  (global-set-key (kbd "M-`") 'ns-next-frame)
  (global-set-key (kbd "M-h") 'ns-do-hide-emacs)
  (global-set-key (kbd "M-˙") 'ns-do-hide-others)
  )
;; macOS keybinding:1 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*sudo%20edit][sudo edit:1]]
(use-package! sudo-edit)
;; sudo edit:1 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*Auto%20Save][Auto Save:1]]
(setq auto-save-visited-file-name t)
;; Auto Save:1 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*Always%20indent%20with%20spaces][Always indent with spaces:1]]
(setq-default indent-tabs-mode nil)
;; Always indent with spaces:1 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*Google%20it][Google it:1]]
(use-package! google-this
  :diminish google-this-mode
  :bind-keymap ("ESC ESC 1" . google-this-mode-submap))
;; Google it:1 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*%5B%5Bhttp://sodaware.sdf.org/notes/emacs-daemon-doom-modeline-icons/%5D%5BEnabling%20doom-modeline%20icons%20when%20using%20daemon%20mode%20-%20sodaware.sdf.org%5D%5D][[[http://sodaware.sdf.org/notes/emacs-daemon-doom-modeline-icons/][Enabling doom-modeline icons when using daemon mode - sodaware.sdf.org]]:1]]
(defun enable-doom-modeline-icons (_frame)
  (setq doom-modeline-icon t))
(add-hook 'after-make-frame-functions
          #'enable-doom-modeline-icons)
;; [[http://sodaware.sdf.org/notes/emacs-daemon-doom-modeline-icons/][Enabling doom-modeline icons when using daemon mode - sodaware.sdf.org]]:1 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*Org%20note%20file][Org note file:1]]
(setq org-default-notes-file "~/Dropbox/Org/inbox.org")
;; Org note file:1 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*Org%20Agenda%20File][Org Agenda File:1]]
(setq org-agenda-files "~/Dropbox/Apps/org-agenda/agenda_files")
;; Org Agenda File:1 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*Org%20Capture%20for%20alfred][Org Capture for alfred:1]]
(defvar org-mac-context nil)

;;; Use org-mac to get link context and insert it to the captured item
(add-hook 'org-capture-prepare-finalize-hook
          (lambda ()
            (when (equal
                   (cdr (assoc 'name (frame-parameters (selected-frame))))
                   "remember")
              (progn
                (goto-char (point-max))
                (if org-mac-context
                    (progn
                      (insert (concat org-mac-context "\n"))
                      (setq org-mac-context nil))
                  nil)
                (call-interactively 'org-mac-grab-link)))))

;;; Delete frame when capture is done
(add-hook 'org-capture-after-finalize-hook
          (lambda ()
            (when (equal
                   (cdr (assoc 'name (frame-parameters (selected-frame))))
                   "remember")
              (delete-frame))))

;;; Code:
(defun make-orgcapture-frame (&optional mytext)
  "Create a new frame and run org-capture."
  (interactive)
  (setq org-mac-context mytext)
  (make-frame '((name . "remember") (width . 100) (height . 30)
                (top . 400) (left . 300)
                ))
  (select-frame-by-name "remember")
  (org-capture))




;;     (add-to-list 'default-frame-alist '(height . 39))
;;     (add-to-list 'default-frame-alist '(width . 124))

;; ;;; Code:
;; ;;; https://github.com/jjasghar/alfred-org-capture
;; (defun make-orgcapture-frame ()
;;   "Create a new frame and run org-capture."
;;   (interactive)
;;   (make-frame '((name . "remember") (width . 124) (height . 39)
;;                 (top . 400) (left . 300)
;;                 (font . "Operator Mono SSm")
;;                 ))
;;   (select-frame-by-name "remember")
;;   (org-capture))
;; Org Capture for alfred:1 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*Visit%20daily%20org%20file][Visit daily org file:1]]
(defun tru/visit-my-org-daily ()
  (interactive)
  (find-file "~/Dropbox/Org/daily.org"))
(global-set-key (kbd "ESC ESC d") 'tru/visit-my-org-daily)
;; Visit daily org file:1 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*Org%20ansi][Org ansi:1]]
(require 'cl)
(defun tru/org-redisplay-ansi-source-blocks ()
  "Refresh the display of ANSI text source blocks."
  (interactive)
  (org-element-map (org-element-parse-buffer) 'export-block
    (lambda (export)
      (when (equalp "ansi" (org-element-property :type export))
        (let ((begin (org-element-property :begin export))
              (end (org-element-property :end export)))
          (ansi-color-apply-on-region begin end))
      )
      )))

;(add-to-list 'org-babel-after-execute-hook #'tru/org-redisplay-ansi-source-blocks)
;(org-babel-do-load-languages 'org-babel-load-languages '((shell . t)))
;; Org ansi:1 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*Display%20preferences][Display preferences:1]]
(setq org-src-tab-acts-natively t)
;; Display preferences:1 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*Display%20preferences][Display preferences:2]]
(setq org-src-window-setup 'current-window)
;; Display preferences:2 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*Display%20preferences][Display preferences:3]]
(use-package! org
  :defer t
   :config
   (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
)
;; Display preferences:3 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*Display%20ansi%20color][Display ansi color:1]]
(defun tru/display-ansi-colors ()
  (interactive)
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region (point-min) (point-max))))
;; Display ansi color:1 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*recentf][recentf:1]]
(add-hook 'after-init-hook 'recentf-mode)
(setq-default
 recentf-max-saved-items 1000
 recentf-exclude '("/tmp/" "/ssh:"))
;; recentf:1 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*multiple-cursors][multiple-cursors:1]]
(defhydra hydra-multiple-cursors (:hint nil)
  "
 Up^^             Down^^           Miscellaneous           % 2(mc/num-cursors) cursor%s(if (> (mc/num-cursors) 1) \"s\" \"\")
------------------------------------------------------------------
 [_p_]   Next     [_n_]   Next     [_l_] Edit lines  [_0_] Insert numbers
 [_P_]   Skip     [_N_]   Skip     [_a_] Mark all    [_A_] Insert letters
 [_M-p_] Unmark   [_M-n_] Unmark   [_s_] Search
 [Click] Cursor at point       [_q_] Quit"
  ("l" mc/edit-lines :exit t)
  ("a" mc/mark-all-like-this :exit t)
  ("n" mc/mark-next-like-this)
  ("N" mc/skip-to-next-like-this)
  ("M-n" mc/unmark-next-like-this)
  ("p" mc/mark-previous-like-this)
  ("P" mc/skip-to-previous-like-this)
  ("M-p" mc/unmark-previous-like-this)
  ("s" mc/mark-all-in-region-regexp :exit t)
  ("0" mc/insert-numbers :exit t)
  ("A" mc/insert-letters :exit t)
  ("<mouse-1>" mc/add-cursor-on-click)
  ;; Help with click recognition in this hydra
  ("<down-mouse-1>" ignore)
  ("<drag-mouse-1>" ignore)
  ("q" nil))
;; multiple-cursors:1 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*vterm][vterm:1]]
(use-package! vterm
  :defer t
   :config
   (define-key vterm-mode-map (kbd "M-v")                #'vterm-yank)
   (define-key vterm-mode-map [remap whole-line-or-region-yank]                #'vterm-yank)
)
;; vterm:1 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*ivy-postframe][ivy-postframe:1]]
(use-package ivy-posframe
  :after ivy
  :diminish
  :config
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center))
        ivy-posframe-height-alist '((t . 20))
        ivy-posframe-parameters '((internal-border-width . 10))
        ivy-posframe-width 188
        )

  ;; (if (member "Menlo" (font-family-list))
  ;;     (setq ivy-posframe-parameters '((internal-border-width . 10) (font . "Menlo")))
  ;;   ivy-posframe-parameters '((internal-border-width . 10)))
  ;; (setq ivy-posframe-width 188)
  (ivy-posframe-mode +1))
;; ivy-postframe:1 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*Auto-Correct%20Words][Auto-Correct Words:1]]
(setq ispell-program-name "/usr/local/bin/ispell")

(define-key ctl-x-map "\C-i"
  #'endless/ispell-word-then-abbrev)

(defun endless/simple-get-word ()
  (car-safe (save-excursion (ispell-get-word nil))))

(defun endless/ispell-word-then-abbrev (p)
  "Call `ispell-word', then create an abbrev for it.
With prefix P, create local abbrev. Otherwise it will
be global.
If there's nothing wrong with the word at point, keep
looking for a typo until the beginning of buffer. You can
skip typos you don't want to fix with `SPC', and you can
abort completely with `C-g'."
  (interactive "P")
  (let (bef aft)
    (save-excursion
      (while (if (setq bef (endless/simple-get-word))
                 ;; Word was corrected or used quit.
                 (if (ispell-word nil 'quiet)
                     nil ; End the loop.
                   ;; Also end if we reach `bob'.
                   (not (bobp)))
               ;; If there's no word at point, keep looking
               ;; until `bob'.
               (not (bobp)))
        (backward-word)
        (backward-char))
      (setq aft (endless/simple-get-word)))
    (if (and aft bef (not (equal aft bef)))
        (let ((aft (downcase aft))
              (bef (downcase bef)))
          (define-abbrev
            (if p local-abbrev-table global-abbrev-table)
            bef aft)
          (message "\"%s\" now expands to \"%s\" %sally"
                   bef aft (if p "loc" "glob")))
      (user-error "No typo at or before point"))))

(setq save-abbrevs 'silently)
(setq-default abbrev-mode t)
;; Auto-Correct Words:1 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*macOS%20open%20iTerm%20in%20current%20directory][macOS open iTerm in current directory:1]]
(defun my/iterm-goto-filedir-or-home ()
  "Go to present working dir and focus iterm"
  (interactive)
  (do-applescript
   " do shell script \"open -a iTerm\"\n"
   )
  (do-applescript
   (concat
    " tell application \"iTerm\"\n"
    "   tell the current session of current window\n"
    (format "     write text \"cd %s\" \n"
            ;; string escaping madness for applescript
            (replace-regexp-in-string "\\\\" "\\\\\\\\"
                                      (shell-quote-argument (or default-directory "~"))))
    "   end tell\n"
    " end tell\n"
    " do shell script \"open -a iTerm\"\n"
    ))
  )
;; macOS open iTerm in current directory:1 ends here

;; [[file:~/Dropbox/Apps/emacs/tru/doom-emacs/config.org::*Easy-hugo][Easy-hugo:1]]
(use-package easy-hugo
  :init
  ;; Main blog
  (setq easy-hugo-basedir "~/Dropbox/git/github/hugo-blog/")
  (setq easy-hugo-url "https://tru2dagame.github.io")
  (setq easy-hugo-previewtime "300")
  ;; (define-key global-map (kbd "C-c C-e") 'easy-hugo)

  (setq easy-hugo-bloglist
        ;; blog2 setting
        '(((easy-hugo-basedir . "~/Dropbox/git/gitlab/ubnt-hugo-blog/blog-ui/")
           (easy-hugo-url . "http://blog.stg.ui.com.cn")
           )
          ;; blog5 for github pages
          ;; ((easy-hugo-basedir . "~/src/github.com/masasam/githubpages/")
          ;;  (easy-hugo-url . "https://yourid.github.io"))
          ;; ;; blog6 for firebase hosting
          ;; ((easy-hugo-basedir . "~/src/github.com/masasam/firebase/")
          ;;  (easy-hugo-url . "https://yourproject.firebaseapp.com"))

          ))
  :bind ("C-c C-e" . easy-hugo))
;; Easy-hugo:1 ends here
