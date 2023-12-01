#!/bin/bash

while IFS="" read -r line; do
    echo "line = $line" >&2
    line=${line//[[:alpha:]]/}
    echo "trim = \"$line\"" >&2
    echo "sample = ${line:0:1}${line: -1}" >&2
    if [[ -n "$line" ]]; then
	echo "${line:0:1}${line: -1}"
    fi
    echo "" >&2
done | awk 'BEGIN {total=0} {total=total+$1} END {print "total = "total}'
