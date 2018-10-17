# nginx+lua 学习记录
	
	记录一下环境搭建过程

下载一堆源码：
```
dl@dl:~/workspace/eotu_nginx$ ls -al
总用量 44
drwxrwxr-x 11 dl dl 4096 Oct  9 17:32 .
drwxrwxr-x 31 dl dl 4096 Oct 16 15:45 ..
drwxrwxr-x  4 dl dl 4096 Oct  9 15:54 debug
drwxrwxr-x  6 dl dl 4096 Oct  9 10:44 echo-nginx-module
drwxrwxr-x  8 dl dl 4096 Oct 17 17:06 .git
drwxr-xr-x  4 dl dl 4096 Jun 27 00:21 lua-5.3.5
drwxrwxr-x  7 dl dl 4096 Oct  9 10:05 luajit-2.0
drwxrwxr-x 11 dl dl 4096 Oct  9 10:13 lua-nginx-module
drwxr-xr-x  9 dl dl 4096 Oct  9 10:20 nginx-1.13.6
drwxrwxr-x 10 dl dl 4096 Oct  9 10:10 ngx_devel_kit
drwxrwxr-x  6 dl dl 4096 Oct  9 16:49 stream-lua-nginx-module
```
在```nginx-1.13.6```中,创建了一个编译文件gcc.sh：
```
export LUAJIT_LIB=/usr/local/lib/
export LUAJIT_INC=/usr/local/include/luajit-2.0/
 ./configure --prefix=/home/dl/workspace/eotu_nginx/debug/nginx \
         --with-ld-opt="-Wl,-rpath,/path/to/luajit-or-lua/lib" \
         --add-module=/home/dl/workspace/eotu_nginx/ngx_devel_kit \
         --add-module=/home/dl/workspace/eotu_nginx/lua-nginx-module \
         --add-module=/home/dl/workspace/eotu_nginx/echo-nginx-module \
         --add-module=/home/dl/workspace/eotu_nginx/stream-lua-nginx-module \
         --with-cc-opt="-DNGX_LUA_USE_ASSERT -DNGX_LUA_ABORT_AT_PANIC" \
         --with-stream
echo "configure done!"
#make 
#echo "make done!"
```
编译后的结果在 ./debug文件夹中，创建了一个运行nginx简易脚本start_nginx.sh
```
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
```
nginx + lua 编程可以在`./debug/nginx`文件夹中，配置`nginx.conf`文件，lua编程文件夹在`./debug/nginx/lua`中



