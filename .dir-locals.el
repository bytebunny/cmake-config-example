;; emacs: add path to the installed headers' location:
((nil . ( ;; to auto-completion:
         (eval . (add-to-list 'company-c-headers-path-system  "/usr/local/include/my_lib-1.0/"))
         ;; to syntax check:
         (eval . (add-to-list 'flycheck-clang-include-path  "/usr/local/include/my_lib-1.0/"))
         )))
