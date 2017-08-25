<link rel="stylesheet" href="../shared/style.css"/>

# Async/Await

## Introduction: callbacks

Many actions in Javascript are *asynchronous*.

An action is considered "asynchronous" if the actions finishes later as opposed to immediately.

For example:

```javascript
function loadScript(src) {
  let script = document.createElement('script');
  script.src = src;
  document.head.append(script);
}

...

loadScript('/my/script.js'); // the script loads a function "function newFunc() { ... }"
newFunc(); // no such function!
```

In this case, the browser probably didn't have time to load the script, so the immediate call to
`newFunc` fails. As of now, there is no way to track the completion of loading our script. It'll
eventually run, but we'd like to know when it's completed so we can call our `newFunc` ASAP.

We can add a *callback* function as a second argument to `loadScript` that should execute when
the script loads:

```javascript
function loadScript(src, callback) {
  let script = document.createElement('script');
  script.src = src;
  script.onload = () => callback();
  document.head.append(script);
}

// Change the way we call loadScript
loadScript('my/script.js', function() {
  newFunction();
});
```

*Note: `onload` is a property of the `GlobalEventHandlers` mixin and is an event hanlder for the load
event, which fires when the resource has loaded.*

### Callback in callback

What if we want to load two scripts one after another? The natural solution would be to add an
additional call to `loadScript` inside the the callback, like so:

```javascript
loadScript('my/script.js', function() {
  newFunction();

  loadScript('my/script2.js', function() {
    newFunction2();
  });
});
```

After the outer `loadScript` is complete, the callback initiates the inner one. This can be
repeated for however many scripts we want to load. This is fine for a few actions, but not good
for many (see [pyramid of doom](#pyramid-of-doom))

### Handling Errors

In examples above we didn't consider errors. What happens if one of the scripts fails to load?
Our callbacks should be able to handle such an event.

```javascript
function loadScript(src, callback) {
  let script = document.createElement('script');
  script.src = src;

  // callback(null) called on success, callback(error) called otherwise
  script.onload = () => callback(null);
  script.onerror = () => callback(new Error(`script load error for ${src`));

  document.head.append(script);
}

...

// Calling loadScript
loadScript('/my/script.js', function(error) {
  if (error) {
    // handle error
  } else {
    // script loaded successfully
  }
});
```

This is a common style known as the "error-first callback" style. This style is handy
because a single callback function can be used to report errors and passing back
vaild results. The convention is:

1.	The first argument of callback is reserved for an error if it occurs. Then
`callback(err)` is called.
2.	The remaining arguments are for the successful result. Then `callback(null, ...)`
is called.

### Pyramid of doom

What we've seen so far seems like a viable way of asynchronous coding, and for what we've
used it for, it is. However, once we start nesting additional callbacks we'll end up with
an increasingly more difficult to manage code and can lead to what is called "callback hell"
or "pyramid of doom".

Each step or callback function can be broken up into it's own function, but then readability
suffers. One way to remedy this is to use *Promises*.

## Promise

A *Promise* in Javascript is special object that produces desired data or results to waiting
consuming code when the data or results are available. 

The constructor syntax for a promise looks like:
```javascript
let promise = new Promise(function(resolve, reject) {
  // executor (the producing code)
});
``` 

The function passed to `new Promise` is called *executor*. When the promise is created, it's
called automatically. It contains the producing code(s), that should eventually finish with a
result.

The resulting `promise` has internal properties:

-   `state`: initially "pending", then changes to "fulfilled" or "rejected"
-   `result`: an arbitrary value, initially `undefined`

When the executor has finished its job, it should call either:

-   `resolve(value)`: to indicate that the job finished successfully:
    - sets `state` to `"fulfilled"`
    - sets `result` to `value`
-   `reject(error)`: to indicate that an error occurred
    - sets `state` to `"rejected"`
    - sets `result` to `error`

The executor will receive two arguments: `resolve` and `reject` - these functions come from the 
JavaScript engine. You need not create them yourself; instead, the the executor should call them
when ready.

The executor should do a job (usually one that takes time) and then call `resolve` or `reject`
to change thte state of the corresponding promise object. After a promise is either resolved
or rejected, it becomes "settled" as opposed to a "pending" promise.
