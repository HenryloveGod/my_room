


#include <stdio.h>
#include <syslog.h>
#include <netinet/in.h>


#include "debug.h"
#include "pstring.h"
#include "safe.h"
#include "util.h"


int main(void){


    printf("hello\n\n");

    struct in_addr *baidu;
    
    baidu = wd_gethostbyname("www.baidu.com");

    debug(LOG_INFO,"%s\n", in_addr2str(baidu) );

}