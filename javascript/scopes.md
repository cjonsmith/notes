<link rel='stylesheet' href='../shared/style.css'/>

# Scopes

There are two main types of scope in Javascript.

1.	Lexical Scoping
2.	Block Scoping

In addition, there are four other scopes in the language:

1.	Global
2.	With
3.	Catch
4.	Eval

## Lexical Scoping

Lexical scoping has been apart of ECMAScript since the beginning.

All variables are scoped either inside the function they were created in, or
are global.

`var` is used to denote a variable which is Lexically Scoped to the current
function.

```javascript
function someFunc() {
	var aVariable;
}
```

## Block Scope

Block Scope was defined in ECMAScript 6. This scope is created within curly
braced blocks (not just functions).

`let` & `const` are used to denote a variable which is Block Scoped to the
current curly braced block.

```javascript
if (true) {
	let aVariable;
}
```
