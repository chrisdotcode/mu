#!/bin/sh
set -e

. "../mu"

# Set some variables.  They don't need to be exported to be made available
# to the `mustache` function.
# shellcheck disable=SC2034
FOO="foo" BAR="bar"

# Call the `mustache` function, passing a template on standard input and
# diffing standard output against a known-good copy.
find "." -type f -name "*.mustache" | while read -r PATHNAME
do
	echo "$PATHNAME" >&2
	mustache <"$PATHNAME" | diff -u - "$PATHNAME.out"
done
