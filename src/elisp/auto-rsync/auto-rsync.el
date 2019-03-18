;; Original code from https://gist.github.com/l3msh0/5006645
;; Modifications by JI:
;; - different rsync options: -avSHxAX
;; - each member of the alist can be a list instead of a dotted pair,
;;   in which case all the remote paths listed in the cdr will be updated.
;; - update is synchronous
;;

;;; auto-rsync-mode -- minor mode for auto rsync
;;
;; Author: @l3msh0
;;

;;; Example
;;
;; (require 'auto-rsync)
;; (auto-rsync-mode t)
;; (setq auto-rsync-dir-alist
;;       (("/path/to/src1/" . "/path/to/dest1/")
;;        ("/path/to/src2/" . "username@hostname:/path/to/dest2/")
;;        ("/path/to/src3/" "host:/path/to/dest3")
;;        ("/path/to/src4/" "host1:/path/to/dest4" "host2:/path/to/dest4" "/evenlocalpath")))

;;; Customize
;;
(defgroup auto-rsync nil "Auto rsync")
(defcustom auto-rsync-command "rsync" "rsync command path" :group 'auto-rsync)
(defcustom auto-rsync-command-option "-avSHxAX --exclude .git --exclude bb --exclude blaze-* --exclude bazel-*" "rsync command option" :group 'auto-rsync)

(defvar auto-rsync-dir-alist nil "Pair of rsync source and destination dir")
(defvar auto-rsync-normalized-alist nil)

;;; Code

(defun auto-rsync-maybe-list (a)
  "returns (list a) if a is an atom, otherwise returns a unchanged"
  (cond ((listp a) a)
        (t (list a))))

(defun auto-rsync-exec-rsync ()
  "execute rsync if editing file path matches src dir"
  (interactive)
  (mapcar 'load (directory-files "~/.emacs.d" t (concat "^host-" (system-name) "-rsync[.]el$") t))
  (let* ((normalized-alist (mapcar
                            (lambda (x) (cons (file-name-as-directory (expand-file-name (car x)))
                                              (mapcar 'file-name-as-directory (auto-rsync-maybe-list (cdr x)))))
                            auto-rsync-dir-alist))
         (sync-pair (assoc-if (lambda (key) (string-match key buffer-file-name)) normalized-alist)))
    (when sync-pair
      (save-window-excursion
        ;; avoid annoying shell comannd window
        (mapcar (lambda (x) (shell-command (format "%s %s %s %s"
                                                   auto-rsync-command
                                                   auto-rsync-command-option
                                                   (car sync-pair) x) nil))
                (cdr sync-pair))))))

(define-minor-mode auto-rsync-mode
  "automatically execute rsync when editing file's path matches `auto-rsync-dir-alist`"
  :lighter " rsync"
  :global t
  (cond (auto-rsync-mode
         (add-hook 'after-save-hook 'auto-rsync-exec-rsync))
        (t
         (remove-hook 'after-save-hook 'auto-rsync-exec-rsync))))

(provide 'auto-rsync)
