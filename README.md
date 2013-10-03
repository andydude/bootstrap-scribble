bootstrap-scribble
==================

Converter from the output of Racket's "scribble --html" to Bootstrap-style HTML5

Information about Racket can be found at http://racket-lang.org/

Information about Scribble can be found at http://docs.racket-lang.org/scribble/

Information about HTML5 can be found at http://www.w3.org/TR/html5/

Information about Bootstrap can be found at http://getbootstrap.com/

Usage
-----

To use boostrap-scribble, run the collowing command:

 `./bscrbl.sh MyDocument.scrbl`

Which will create a temporary directory, and put the final document in `MyDocument.html` along-side a sample document `MyDocument-sample.html` which includes an HTML5 document type declaration, and Bootstrap CSS headers, along with Bootstrap JavaScript elements and the required jQuery include. If you already have some kind of templating system, you can put the first document in your body tag, or if you want to see what it will look like, then you can open up the second document in a web browser.