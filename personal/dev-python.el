(prelude-require-package 'elpy)
(require 'elpy)
(elpy-enable)
(setq elpy-rpc-backend "jedi")
(setq elpy-modules
      (quote
       (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-yasnippet elpy-module-sane-defaults)))
