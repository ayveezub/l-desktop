# LXQt


## xdg-desktop-portal-lxqt

A backend implementation for [xdg-desktop-portal](http://github.com/flatpak/xdg-desktop-portal)
that is using Qt/KF5/libfm-qt.

### Use LXQt filedialog in applications

* Firefox version 98 and higher:  Open in the address bar `about:config`, search for "portal" and set both `widget.use-xdg-desktop-portal.file-picker` and `widget.use-xdg-desktop-portal.mime-handler`  from `2` to `1`. Older versions of Firefox use the same setting as Thunderbird.
* Thunderbird: Preferences > Configuration Editor `widget.use-xdg-desktop-portal` has to be set to `true`. 
* Some other GTK applications can be started with `GTK_USE_PORTAL=1 application`

A general use of `GTK_USE_PORTAL=1` in `~/.profile` or `/etc/profile` can lead to issues and
is not recommended.
