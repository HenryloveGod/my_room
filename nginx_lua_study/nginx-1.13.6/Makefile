
default:	build

clean:
	rm -rf Makefile objs

build:
	$(MAKE) -f objs/Makefile

install:
	$(MAKE) -f objs/Makefile install

modules:
	$(MAKE) -f objs/Makefile modules

upgrade:
	/home/dl/workspace/eotu_nginx/debug/nginx/sbin/nginx -t

	kill -USR2 `cat /home/dl/workspace/eotu_nginx/debug/nginx/logs/nginx.pid`
	sleep 1
	test -f /home/dl/workspace/eotu_nginx/debug/nginx/logs/nginx.pid.oldbin

	kill -QUIT `cat /home/dl/workspace/eotu_nginx/debug/nginx/logs/nginx.pid.oldbin`
