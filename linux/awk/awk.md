<link rel='stylesheet' href='../../shared/style.css'>

<a href='../../index.html'>Return to homepage.</a>

# Awk

```bash
man awk

...

> NAME
>        awk - pattern-directed scanning and processing language
```

Awk is a language used to perform *actions* on file lines (everything in Unix is a file, even program output) based on a set of
*patterns*. A proper pattern-action statement has the form

`pattern { action }`

An *action* can be omitted, and when it is, the default action is print the line. Similarly, a *pattern* does not need to be
supplied. All lines will be matched if a *pattern* is not defined.
