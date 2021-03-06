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
(package! ivy-posframe)
(package! helm-org-rifle)
(package! nyan-mode)
(package! edit-server)
(package! whitespace-cleanup-mode)
(package! pinyinlib)
(package! pinyin-search)
(package! youdao-dictionary)
(package! ob-tmux)
(package! wgrep)
(package! rg)
(package! easy-hugo)
;;(package! undo-tree)
(package! sudoku)
(package! valign
  :recipe (:host github :repo "casouri/valign"
           :files ("valign.el" ))
  :pin "1d2ecd2afdb77021eaffc213d9fbbc6d9c38ed82")
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

;;; $DOOMDIR/packages.el end
