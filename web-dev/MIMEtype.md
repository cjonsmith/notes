<link rel='stylesheet' href='../shared/style.css'/>

# MIME Types

The **MIME type** (Multipurpose Internet Mail Extension) is a label to tell 
the client the types of documents that are transmitted.^[1]^ 

A MIME type has two parts: a **type** and a **subtype** that are separated by
a slash. For example: `type/subtype`.

## Common Types and Subtypes

|Type       |Description                            |             Common Subtypes|
|:----------|:--------------------------------------|---------------------------:|
|Text       |Represents documents that contain text.|plain, html, css, javascript|
|Image      |Represents any kind of image.          |    gif, png, bmp, webp, svg|
|Audio      |Represents any kind of audio.          |  midi, mpeg, webm, ogg, wav|
|Video      |Represents any kind of video.          |                   webm, ogg|
|Application|Represent any binary data.             |      mspowerpoint, xml, pdf|

## Example: Adding Source Code to Webpage^[2]^

```html
<object
		data="http://example.com/source/my_code.py"
		type="text/plain">  <!-- MIME Type -->
		<p>Source code of
		<a href="/source/my_code.py">my_code</a></p>
<\object>
```

<!-- Resources -->
[1]: https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types
[2]: https://www.w3.org/QA/2004/02/object/object-example-03.html
