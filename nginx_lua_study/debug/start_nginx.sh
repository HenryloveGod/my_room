#!/bin/bash

process=$(ps aux |grep sbin/nginx |grep -v grep)
if [ ! "$process" = "" ]; then
    echo "kill old nginx"
    killall -9 nginx
fi

root_path=$(pwd)
ngx_root=$root_path/nginx

ngx=$ngx_root/sbin/nginx
ngx_conf=$ngx_root/conf/nginx.conf

res=$($ngx -c $ngx_conf -t 2>&1)

if [[ "$res" = *successful* ]]; then
    #echo "TEST CONFIG successful"
    case $1 in
        -f)
            echo "start nginx in foreground"
            $ngx -c $ngx_conf -g 'daemon off;'
        ;;
        *)
            echo "start nginx in backgrouad"
            $ngx -c $ngx_conf
        ;;
    esac
else
    echo "TEST CONFIG FAIL"
    echo $res
fi