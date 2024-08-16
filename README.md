# 📍 pin-buffer for GNU/Emacs

When you switch a buffer in GNU/Emacs it could reuse any of opened
windows to place new buffer content. Sometimes this behavior is
annoying. The extension just pins buffer to current window in
GNU/Emacs. It will omited during switching buffers and using for
popups until you unpin it (or close it).

* toggles buffer state between dedicated/normal
* displays 📌 in modeline for dedicated mode
* it's all

## Install with straight

```elisp
(use-package pin-buffer
  :bind ("<f11>" . 'pin-buffer)
  :straight (pin-buffer :type git :host github :repo "grafov/pin-buffer"))
```

## Usage

Just call `M-x pin-buffer` to toglle current buffer.

## Explanation

The code uses "dedicated window" feature of Emacs. You could do it in
your manner without this extension. Just check this code for idea:

```elisp
  (let (window (get-buffer-window (current-buffer)))
	 (if (set-window-dedicated-p window
						 (not (window-dedicated-p window)))))
```

### Similar plugins

- [dedicated.el](https://github.com/emacsmirror/dedicated/blob/master/dedicated.el)
- [dedicate-windows-manually.el](https://www.emacswiki.org/emacs/dedicate-windows-manually.el)

## License

Under terms of GPL v3. See LICENSE file.
