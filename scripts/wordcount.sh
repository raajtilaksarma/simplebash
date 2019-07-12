#!/bin/sh

programname=$0
function usage(){ 
    echo "usage: $programname [filename]"
    echo "  -h      display help"
    exit 1
}

if [[ ( $@ == "--help") ||  $@ == "-h" ]]; then 
	usage
	exit 0
fi

if [ x"$1" = "x" ]; then
        echo "Filename required!"
        exit 1
fi
awk '{for(x=1; $x; ++x)print $x}' "${1}" | sort | uniq -c | awk '{print $2,$1}'
