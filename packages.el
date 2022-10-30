;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here, run 'doom sync' on
;; the command line, then restart Emacs for the changes to take effect.
;; Alternatively, use M-x doom/reload.
;;
;; WARNING: Disabling core packages listed in ~/.emacs.d/core/packages.el may
;; have nasty side-effects and is not recommended.


;; All of Doom's packages are pinned to a specific commit, and updated from
;; release to release. To un-pin all packages and live on the edge, do:
;(unpin! t)

;; ...but to unpin a single package:
;(unpin! pinned-package)
;; Use it to unpin multiple packages
;(unpin! pinned-package another-pinned-package)


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a particular repo, you'll need to specify
;; a `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, for whatever reason,
;; you can do so here with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

(package! ox-twbs)
(package! sudo-edit)
(package! google-this)
(package! git-auto-commit-mode)
(package! grab-mac-link)
;(package! ivy-posframe)
(package! helm-org-rifle)
(package! nyan-mode)
(package! edit-server)
;(package! whitespace-cleanup-mode)
(package! pinyinlib)
(package! pinyin-search)
(package! youdao-dictionary)
(package! ob-tmux)
(package! wgrep)
(package! rg)
(package! easy-hugo)

;https://gitlab.com/tsc25/undo-tree/-/blob/release/0.8.1/undo-tree.el
(package! undo-tree
  :recipe (:host gitlab :repo "tsc25/undo-tree"
           :files ("undo-tree.el" ))
  :pin "594ed6a788c8a51ee97da071aac22ea0c12b43d4")
(package! sudoku)
(package! valign
  :recipe (:host github :repo "casouri/valign"
           :files ("valign.el" ))
  :pin "421c8c0cb4636e5fd87ac1022d6b8268c320f74f")
(package! yaml-mode)
(package! super-save)
(package! graphql-mode)
(package! ob-graphql)
 (package! mac-pseudo-daemon
  :recipe (:host github :repo "DarwinAwardWinner/mac-pseudo-daemon"
           :files ("mac-pseudo-daemon.el" ))
  :pin "564b006835facc4a8df247d8a47ab1030d7e7beb")
;;(package! doom-modeline :pin "4956606a5455a3968ca10cbdb8de3889e6bd1d85")

(package! w3m)
(package! notmuch-labeler)
(package! org-tree-slide)
(package! org-present)
(package! osx-dictionary)
(package! popper
  :recipe (:host github :repo "karthink/popper"
           :files ("popper.el")))
(package! org-kanban)
(package! blamer :recipe (:host github :repo "artawower/blamer.el"))
;(package! dash-at-point :recipe (:host github :repo "stanaka/dash-at-point"))
(package! screenshot :recipe (:host github :repo "tecosaur/screenshot"))

(package! silicon :recipe (:host github :repo "iensu/silicon-el"))
(package! org-roam-ui)
(package! org-bars :recipe (:host github :repo "tonyaldon/org-bars" :files ("org-bars.el")))
(when IS-MAC
  (package! org-mac-link :recipe (:host github :repo "emacsmirror/org-mac-link"))
  (package! org-mac-iCal :recipe (:host github :repo "ndw/org-mac-iCal"))
)
(package! denote :recipe (:host github :repo "protesilaos/denote"))

;; eaf
;; (package! eaf
;;   :recipe (:host github :repo "manateelazycat/emacs-application-framework"
;;            :files ("eaf.el")))
;; (package! epc)
;; (package! ctable)
;; (package! deferred)
;; (package! s)
;; end eaf

;;; $DOOMDIR/packages.el end
