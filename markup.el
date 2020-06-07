
(defun groff-compile()
  (interactive)
  (setq filename (buffer-file-name (current-buffer)))

  (setq command (concat "groff -ms " filename " -Tpdf >" filename ".pdf"))
  (shell-command command)

  )

(defun groff-compile-to-ps()
  (interactive)
  (setq filename (buffer-file-name (current-buffer)))

  (setq command (concat "groff -ms  " filename "> " filename ".ps"))
  (shell-command command)

  )

(defun pandoc-compile-to-pdf()
  (interactive)
  (setq filename (buffer-file-name (current-buffer)))

  (setq command (concat "pandoc " filename " -o " filename ".pdf"))
  (shell-command command)

  )


(defun pandoc-compile-to-html()
  (interactive)
  (setq filename (buffer-file-name (current-buffer)))

  (setq command (concat "pandoc " filename " -o " filename ".html"))
  (shell-command command)

  )

(defun pandoc-beamer-compile()
  (interactive)
  (setq filename (buffer-file-name (current-buffer)))

  (setq command (concat "pandoc " filename " -t beamer -o " filename ".pdf"))
  (shell-command command)

  )

