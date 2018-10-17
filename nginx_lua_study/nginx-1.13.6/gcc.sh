
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
