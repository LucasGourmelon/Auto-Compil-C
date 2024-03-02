#!/bin/bash
if [ $(($#!=1)) == 1 ]; then
    echo 'This script expects one parameter';
    exit 1;
fi

length=${#1};
sub=2;
length=$(($length-$sub)); 

while inotifywait -qe modify $1; do
    echo -e '----------';
    exeName=$(echo $1 | cut -c 1-$length);
    gcc $1 -o $exeName;
    ./$exeName;
    echo -e '----------';
done