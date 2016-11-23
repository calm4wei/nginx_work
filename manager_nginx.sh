#!/bin/bash

Usage='''
$0 <stop|quit|reload>
'''
if [ $# -ne 1 ]; then
    echo "$Usage"
    exit 1
fi

CMD=$1

case $1 in
start)
    echo "start..."
    nginx -p `pwd`/ -c conf/nginx.conf
    ;;
*)
    echo "others..."
    nginx -s "$CMD" -p `pwd`/ -c conf/nginx.conf
    ;;
esac

