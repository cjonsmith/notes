<link rel='stylesheet' href='../shared/style.css'>

# Following Web Links from VIM

If running on [gnome desktop environment](https://www.gnome.org/) or mac, simply use `gx` when in normal mode.

From the vim `:help gx` command:
```
CUSTOMIZING BROWSING WITH A SPECIAL HANDLER

...

Certain files, such as html, gif, jpeg, (word/office) doc, etc, files, are
best seen with a special handler (ie. a tool provided with your computer's
operating system).  Netrw allows one to invoke such special handlers by: >

	* when Exploring, hit the "x" key
	* when editing, hit gx with the cursor atop the special filename

...

  * for Windows 32 or 64, the URL and FileProtocolHandler dlls are used.
  * for Gnome (with gnome-open): gnome-open is used.
  * for KDE (with kfmclient)   : kfmclient is used
  * for Mac OS X               : open is used.
  * otherwise the netrwFileHandler plugin is used.

The file's suffix is used by these various approaches to determine an
appropriate application to use to "handle" these files.  Such things as
OpenOffice (*.sfx), visualization (*.jpg, *.gif, etc), and PostScript (*.ps,
*.eps) can be handled.
```

So, in addition to following web links, you can also open other files in your
system's default application based on the file extension.

<a href='../index.html'>Return to homepage.</a>
