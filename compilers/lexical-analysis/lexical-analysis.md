<link rel='stylesheet' href='../../shared/style.css'>

<a href='../../index.html'>Return to homepage.</a>

# Lexical Analysis

Divide code into *lexical units* using a lexical analyzer.

```
if (i == j)
	z = 0;
else
	z = 1;
```

becomes:

```
if (i == j)\n\tz = 0;\n\telse z = 1;
```

## Token Class (Class)

*In English* (not comprehensive)

-	Noun
-	Verb
-	Adjective

*In a programming language* (not comprehensive)

-	Identifier
-	Operator
-	Keywords
-	Whitespace

Tokenization classify program *substrings* according to role in order to communicate tokens to the parser. For example, consider the snippet of code `foo=42`. The tokenized form of this code would be `<Identifier, "foo">, <Operator, =>, <Integer, 42>`.

## Lexical Analysis Examples

FORTRAN rule: Whitespace is insignificant

`VAR1` is the same as `VA R1`

### Lookahead

Consider the do-loops below. If whitespace doesn't matter in FORTRAN, how does the compiler know if
the first part of each loop is the keyword `DO` or is a part of an identifier `DO5i`?

```
DO 5 i = 1,25 # comma
DO 5 i = 1.25 # period
```

The answer is by using *lookahead*! Lookahead is a concept of lexical analysis that a token 
cannot be properly identified without looking ahead at future tokens to determine what the 
current token class is.

Why does FORTRAN have this rule? With punchcards, it's easy to accidentally enter whitespace 
by accident. Ignoring whitespace removes this problem.

The goal of lexical analysis is to *partition the string*. This is implemented by reading left to 
right, recognizing one token at a time. Lookahead may be required to decide where one token ends 
and the next token begins. Lookahead will *always* be required, but in order to avoid confusion, 
lookahead use should be minimized.

```
if (i == j)  # Lookahead required here: when first = is reached, how do you know it's really '=='?
	z = 0;
else  # Lookahead required here: how can compiler know if 'e' is part of identifier or keyword?
	z = 1;
```

PL/1 rule: keywords are not reserved.

```
IF ELSE THEN THEN = ELSE; ELSE ELSE = THEN
^        ^                 ^
|________|_________________|
         |
       keywords; all others are variables
```

Some PL/1 syntax: `DECLARE` is a keyword, and arrays can be populated at initialization by putting the elements inside of parens ().

```
DECLARE(arg1, ..., argN)
```

It is impossible to know whether the statement above is using DECLARE as a keyword, or as an identifier to an array. Not only that, but since there can be `N` number of elements inbetween the parens, lookahead will be required for an indeterminent amount of time. This is know as *unbounded lookahead.* If there is an `=` following the statement, then it would be an array assignment.

Consider the C++ code below:

```
Foo<Bar<Baz>>
```

Is the `>>` at the end the stream output operator, or is it a part a nested template?
