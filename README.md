Summary
-------

Recolouring of the GTK3 Adwaitha theme in the spirit of Zenburn.

Upstream URL: https://gitlab.gnome.org/GNOME/gtk/-/tree/gtk-3-24/gtk/theme/Adwaita

Installation
------------
Build dependencies: `make, sass, inkscape, rsync, gtk3-widget-factory` (for testing)

```bash
make -j8 install
export GTK_THEME=Adwaitha-Zenburn
```

Run `make test` to see what the theme looks like.

How to tweak the theme
----------------------

Edit `src/_colors.scss` to tweak the colours.
For other modifications see the upstream README.

License
-------
This theme is released under the terms of the GNU Lesser General Public
License, version 2.1 or, at your option, any later version, as published by the
Free Software Foundation.
