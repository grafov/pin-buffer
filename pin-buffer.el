;;; pin-buffer.el --- extension that pins buffer to current window

;; Copyright (C) 2024 Alexander I.Grafov and the project
;; contibutors.

;; Author: Alexander I.Grafov <grafov@inet.name>
;; Version: 1.0
;; Keywords: ui
;; URL: https://github.com/grafov/pin-buffer
;; License: GPL v3.0

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;; Pins buffer to current window

;;; Code:

(defvar pin-buffer-mark "📌"
  "The mark to display in the mode line when buffer is pinned.")

;;;###autoload
(defun pin-buffer (&optional mode)
  "Toggle whether the current active window is dedicated or not"
  (interactive)
  (let* ((window (get-buffer-window (current-buffer)))
	 (mode (if (called-interactively-p 'any)
		   (not (window-dedicated-p window))
		 mode)))
    (set-window-dedicated-p window mode)
    (if (called-interactively-p 'any)
	(if mode
	    (message "Buffer '%s' is pinned to window" (current-buffer))
	  (message "Buffer '%s' is unpinned" (current-buffer))))
    (pin-buffer-update-mode-line mode)))

(defun pin-buffer-update-mode-line (mode)
  "Update the mode line of the current buffer."
  (setq mode-line-format
	(if mode
	    (if (not (member '(:eval (pin-buffer-lighter)) mode-line-format))
	       (cons '(:eval (pin-buffer-lighter)) mode-line-format) mode-line-format)
	  (remove '(:eval (pin-buffer-lighter)) mode-line-format)))
  (force-mode-line-update))

(defun pin-buffer-lighter ()
  "Return pin mark if it should be displayed in the mode line."
  (if (member '(:eval (pin-buffer-lighter)) mode-line-format)
    pin-buffer-mark
    ""))

(provide 'pin-buffer)
;;; pin-buffer.el ends here
