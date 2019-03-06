<link rel='stylesheet' href='../shared/style.css'>

<a href='../index.html'>Return to homepage.</a>

# Functions

## Infix

Infix functions are called by invoking the function between two operands. For example:

```haskell
2 + 2
```

In this case, `+` is our infix function. This applies to all basic arithmetic functions like `*`, `/`, or `-`. Infix functions can be called as prefix functions as well by surrounding the function in parenthesis `()`. For example:


```haskell
(+) 19 2
```

In this case, we are invoking addition using prefix notation, where it's operands are supplied after the function.

## Prefix

Prefix functions are called by invoking the function _before_ supplying any operands. For example:

```haskell
min 40 2
```

In this case, `min` is our prefix function. In Haskell, function parameters are supplied and separated by spaces after the function name. Prefix functions that take arguments can be invoked using infix notation by surrounding the function name in backticks ``. For example:

```haskell
40 `min` 2
```

However, it is usually more succinct and clear to *not* use this notation to avoid confusion.
