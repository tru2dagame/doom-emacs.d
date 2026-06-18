;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)

(package! mac-pseudo-daemon
  :recipe (:host github :repo "DarwinAwardWinner/mac-pseudo-daemon"
           :files ("mac-pseudo-daemon.el" ))
  :pin "94240ebb716f11af8427b6295c3f44c0c43419d3")
(package! nyan-mode)
(package! bufler
  :recipe (:host github :repo "alphapapa/bufler.el"
           :files ("bufler-group-tree.el" "bufler-workspace.el" "bufler-workspace-tabs.el" "bufler.el")))
(package! sudo-edit)
(package! flyspell-correct
   :recipe (:host github :repo "d12frosted/flyspell-correct"
            :files ("flyspell-correct.el" "flyspell-correct-ivy.el" "flyspell-correct-popup.el")))
(package! tabspaces
   :recipe (:host github :repo "mclear-tools/tabspaces"
            :files ("tabspaces.el")))
(package! super-save)
(package! ob-tmux)
(package! helm-org-rifle)
(package! org-ql)
(package! valign
  :recipe (:host github :repo "casouri/valign"
           :files ("valign.el" ))
  :pin "421c8c0cb4636e5fd87ac1022d6b8268c320f74f")
(package! org-bars :recipe (:host github :repo "tonyaldon/org-bars" :files ("org-bars.el")))
(package! org-roam-ui)
(package! git-auto-commit-mode)
(package! easy-hugo)
(package! org-auto-tangle)
(package! emamux)
(package! fzf)

;; f.el 0.20.0 has a shortdoc keyword typo that breaks Emacs 30.
(package! f :pin "931b6d0667fe03e7bf1c6c282d6d8d7006143c52")

;; Emacs 29+ provides Docker TRAMP through the built-in tramp-container.
(package! docker-tramp :disable t)

;; Doom+'s Go doctor still checks this when :lang go is used without +lsp.
(package! company-go :pin "31948b463f2fc18f8801e5a8fe511fef300eb3dd")

;; MELPA no longer ships a standalone git-commit recipe, but Magit still
;; declares it as a dependency and includes it in the Magit repo.
(package! git-commit
  :recipe (:host github
           :repo "magit/magit"
           :files ("lisp/git-commit.el" "lisp/git-commit-pkg.el"))
  :pin "c800f79c2061621fde847f6a53129eca0e8da728")

;; org-roam >= 2.3 needs EmacSQL 4.x's SQLite interface.
(package! emacsql :pin "d811bbefcb5e27841af55cae53aa939ba720de77")

;; Same issue as git-commit: this split package is provided by the parent
;; repository, but no longer has a standalone MELPA recipe.
(package! emacsql-sqlite
  :recipe (:host github
           :repo "magit/emacsql"
           :files ("emacsql-sqlite.el"
                   "emacsql-sqlite-builtin.el"
                   "emacsql-sqlite-module.el"))
  :pin "d811bbefcb5e27841af55cae53aa939ba720de77")

;; Upstream renamed master to main; spell it out so straight doesn't try the
;; removed branch while updating this long-lived package checkout.
(package! package-lint
  :recipe (:host github
           :repo "purcell/package-lint"
           :branch "main"
           :files (:defaults "data" (:exclude "*flymake.el")))
  :pin "7e2dfcf99011fa82d92baba973841db717657964")

;; end
