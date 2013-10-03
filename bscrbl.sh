#!/bin/bash
FILE="$1"
BASE=$(basename "$FILE" .scrbl)
APP_DIR=$(dirname $0)
TMP_DIR=$(mktemp -dt scribble)

# step 1: check filename extension
EXT=$(echo "$FILE" | cut -d'.' -f2)
if [ x"$EXT" != x"scrbl" ]; then
    echo "$0: ERROR: filename must end in .scrbl, but it doesn't"
    exit 1
fi

# scribble produces ${BASE}.html
scribble --quiet --html "${BASE}.scrbl"
if [ $? -ne 0 ]; then
    echo "$0: ERROR: scribble didn't like the input"
    exit $?
fi
mv "${BASE}.html" "${TMP_DIR}/${BASE}.1.html"

xmllint --html "${TMP_DIR}/${BASE}.1.html" --xmlout > "${TMP_DIR}/${BASE}.2.html"
if [ $? -ne 0 ]; then
    echo "$0: ERROR: xmllint didn't like the input"
    exit $?
fi

python "${APP_DIR}/scribble2bootstrap.py" "${TMP_DIR}/${BASE}.2.html" > "${TMP_DIR}/${BASE}.3.html"
if [ $? -ne 0 ]; then
    echo "$0: ERROR: python's ElementTree didn't like the input"
    exit $?
fi

echo '<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" />
        <style>
         body {
           margin-top: 47px;
           line-height: 2;
         }
         .stt {
           font-family: monospace;
         }
         .col-sidebar .panel {
           position: fixed;
           width: 260px;
           top: 40px;
           margin-top: 30px;
           margin-bottom: 30px;
           padding-top:    10px;
           padding-bottom: 10px;
           background-color: #f8f8f8;
         }
/*
         .col-sidebar ol li {
           display: list-item;
           list-style-type: decimal;
         }
*/
         .col-sidebar li > a {
           padding-top: 0px;
           padding-bottom: 0px;
         }

         /* All levels of nav */
         .col-sidebar .nav > li > a {
           display: block;
           color: #716b7a;
         }
         .col-sidebar .nav > li > a:hover,
         .col-sidebar .nav > li > a:focus {
           text-decoration: none;
           background-color: #e7e7e7;
         }
         .col-sidebar .nav > .active > a,
         .col-sidebar .nav > .active:hover > a,
         .col-sidebar .nav > .active:focus > a {
           font-weight: bold;
           color: #3276b1;
           background-color: transparent;
         }
         /* Second level */
         .col-sidebar .nav .nav > li > a {
           padding-left: 30px;
         }
         /* Third level */
         .col-sidebar .nav .nav .nav > li > a {
           padding-left: 50px;
         }
        </style>
    </head>
    <body data-spy="scroll" data-target=".col-sidebar" data-offset="60">
        <div class="navbar navbar-default navbar-fixed-top">
            <div class="container">
            </div>
        </div>' >> "${TMP_DIR}/header.html"
echo '        <!-- scripts -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    </body>
</html>' >> "${TMP_DIR}/footer.html"

cat "${TMP_DIR}/header.html" "${TMP_DIR}/${BASE}.3.html" "${TMP_DIR}/footer.html" > "${TMP_DIR}/${BASE}.4.html"

xmllint --html --htmlout --pretty 2 "${TMP_DIR}/${BASE}.4.html" > "${TMP_DIR}/${BASE}.5.html"
echo "${TMP_DIR}/${BASE}.5.html"

# Produce a sample page of what it would look like
cp "${TMP_DIR}/${BASE}.4.html" "${BASE}-sample.html"

# Produce a body
cp "${TMP_DIR}/${BASE}.3.html" "${BASE}.html"

exit 0
