#!/bin/bash
FILE="$1"
BASE=$(basename "$FILE" .scrbl)
APP_DIR=$(dirname $0)
HTML_DIR="$APP_DIR/templates"
TEMP_DIR=$(mktemp -dt scribble)

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
mv "${BASE}.html" "${TEMP_DIR}/${BASE}.1.html"

xmllint --html "${TEMP_DIR}/${BASE}.1.html" --xmlout > "${TEMP_DIR}/${BASE}.2.html"
if [ $? -ne 0 ]; then
    echo "$0: ERROR: xmllint didn't like the input"
    exit $?
fi

python "${APP_DIR}/bscrbl.py" "${TEMP_DIR}/${BASE}.2.html" > "${TEMP_DIR}/${BASE}.3.html"
if [ $? -ne 0 ]; then
    echo "$0: ERROR: python's ElementTree didn't like the input"
    exit $?
fi

cat "${HTML_DIR}/header-sample.html" "${TEMP_DIR}/${BASE}.3.html" "${HTML_DIR}/footer-sample.html" > "${TEMP_DIR}/${BASE}.4.html"

xmllint --html --htmlout --pretty 2 "${TEMP_DIR}/${BASE}.4.html" > "${TEMP_DIR}/${BASE}.5.html"
echo "${TEMP_DIR}/${BASE}.5.html"

# Produce a sample page of what it would look like
cp "${TEMP_DIR}/${BASE}.4.html" "${BASE}-sample.html"
cp "${HTML_DIR}/bootstrap-scribble.css" "$(dirname $FILE)/bootstrap-scribble.css"

# Produce a body
cp "${TEMP_DIR}/${BASE}.3.html" "${BASE}.html"

exit 0
