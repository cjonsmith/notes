<link rel='stylesheet' href='../shared/style.css'>

# File Finding in VIM

Editing serveral files in VIM can be sluggish at times, especially when a
additional file(s) need to be opened. However, VIM offers the `find` command
to help locate files located along your VIM `path` (see `:help path`).

## The Find Command

From the vimdocs (`:help find`):

```vim
							*:fin* *:find*
:fin[d][!] [++opt] [+cmd] {file}
			Find {file} in 'path' and then |:edit| it.
			{not in Vi} {not available when the |+file_in_path|
			feature was disabled at compile time}
```

So we can use the `:find` command to help locate and open additional files
along `path`. So lets say we have a current working tree on our project like
this:

```
my-proj
|-- README
|-- doc
|   `notes.md
|-- src
|   | -- main.c
|   ` -- main.h
```

And we run `vim` from our root directory (`./my-proj`). Now we want to find and
edit our README; we can use our `find` command to do that!

```vim
:find README " opens README
``` 

Now this is pretty basic, and more often than not we'll just open the file
when starting vim. However, lets assume we want to make changes to our `main.c`
file.

```vim
:find main.c " Error: Can't find file "main.c" in path
```

Bummer; looks like we'll have to open it manually using the full path to
file, right? Not necessarily; we can make changes to our `path` to make better
use of our newfound `find` command.

## The VIM Path

Let's take a look at what the vimdocs have to say about `path` (`:help path`):

*Note: I've trimmed out a lot the content that isn't relative to what we
 need for these notes; feel free to read the rest of docs for yourself! The
 ellipses denote when content was removed.*

```vim
				*'path'* *'pa'* *E343* *E345* *E347* *E854*
'path' 'pa'		string	(default on Unix: ".,/usr/include,,"
				   on OS/2:	  ".,/emx/include,,"
				   other systems: ".,,")
			global or local to buffer |global-local|
			{not in Vi}
	This is a list of directories which will be searched when using the
	|gf|, [f, ]f, ^Wf, |:find|, |:sfind|, |:tabfind| and other commands,
	provided that the file being searched for has a relative path (not
	starting with "/", "./" or "../").  The directories in the 'path'
	option may be relative or absolute.
	- Use commas to separate directory names: >
		:set path=.,/usr/local/include,/usr/include

...

<	- To search relative to the directory of the current file, use: >
		:set path=.

...

<	- To search in the current directory use an empty string between two
	  commas: >
		:set path=,,

...

<	Don't forget "." or files won't even be found in the same directory as
	the file!

...

	The use of |:set+=| and |:set-=| is preferred when adding or removing
	directories from the list.  This avoids problems when a future version

...

<	To add the current directory use: >
		:set path+=
```
 
So now that we know that the vim `path` will be how files are found when we're
searching for them, lets take a look at what's in our `path`.

```vim
:set path? " path=.,/usr/include,,
```

After reading the docs, we know that all directores are comma separated, so
we're looking at three directories to be searched:

1.	`.`: The directory of the currently opened file
2.	`/usr/include`
3.	`` (Empty path): The current directory.

So now we're seeing why we can't find `main.c`: it's nowhere to be found on
our `path`!

We can make changes to our path though, so a simple (but lackluster) solution
would be to simply add `src` to our path using the command:

```vim
:set path+='./src' " Run from the my-proj directory
```

As you can see, if you wanted this to work for any other directory, it would 
also have to be added to the path, which isn't really desirable. There is a
solution to our problem, and it lies within the vimdocs under the *file-searching*
docs (`:help file-searching`):

*Note: again, lots of trimmed content. Some of it may be very intresting/useful,
so I'd recommend reading these docs yourself!*

```vim
11. File Searching					*file-searching*

{not available when compiled without the |+path_extra| feature}

The file searching is currently used for the 'path', 'cdpath' and 'tags'
options, for |finddir()| and |findfile()|.  Other commands use |wildcards|
which is slightly different.

There are three different types of searching:

1) Downward search:					*starstar*
   Downward search uses the wildcards '*', '**' and possibly others
   supported by your operating system.  '*' and '**' are handled inside Vim,
   so they work on all operating systems.  Note that "**" only acts as a
   special wildcard when it is at the start of a name.

...

   '**' is more sophisticated:
      - It ONLY matches directories.
      - It matches up to 30 directories deep by default, so you can use it to
	search an entire directory tree

...

      - '**' can only be at the end of the path or be followed by a path
	separator or by a number and a path separator.
```

So the *starstar* (`**`) wildcard will search down our directory tree when
looking for a new file. Great! That's exactly what we need! Let's add it to
our `path`:

```vim
:set path+=** " Add downward search wildcard to our path
```

And lets try our search one more time:

```vim
:find main.c " Success!
```

## Fuzzy Finding

A popular feature of file searching is *fuzzy finding*, which is an
auto-complete of sorts when looking for a file. For example, let's say you
want to find all HTML files in your current codebase. Vim makes use of wildcards
to help emulate a fuzzy finding system:

```vim
:find *.html " Press <TAB> to cycle through matching files in path
```

Super useful! But I still have one complaint; I can't see all matches!
Thankfully there is a builtin option that aleviates this issue:

```vim
:help wildmenu

				*'wildmenu'* *'wmnu'* *'nowildmenu'* *'nowmnu'*
'wildmenu' 'wmnu'	boolean	(default off)
			global
			{not in Vi}
			{not available if compiled without the |+wildmenu|
			feature}
	When 'wildmenu' is on, command-line completion operates in an enhanced
	mode.  On pressing 'wildchar' (usually <Tab>) to invoke completion,
	the possible matches are shown just above the command line, with the
	first match highlighted (overwriting the status line, if there is
	one).  Keys that show the previous/next match, such as <Tab> or
	CTRL-P/CTRL-N, cause the highlight to move to the appropriate match.
```

Now when we press our `wildchar` key (tab, usually) we'll get a pretty
list of matching files from our finds! This command can be turned on
in your .vimrc with `set wildmenu`
