


#include <stdio.h>
#include <syslog.h>
#include <netinet/in.h>
#include <stdlib.h>

#include "debug.h"
#include "pstring.h"
#include "safe.h"
#include "util.h"


int main(void){


    printf("hello\n\n");

    struct in_addr *baidu;
    
    baidu = wd_gethostbyname("baidu.com");
    baidu->s_addr = ntohl(baidu->s_addr);
    debug(LOG_INFO,"%s\n", in_addr2str(baidu) );


    char str[] = "xx for xx"; 
    char c[] = "xx"; 
    char d[] = "Geeks"; 
  
    char *result = NULL; 
  
    // oldW string 
    printf("Old string: %s\n", str); 
  
    result = str_replace(str, c, d); 
    printf("New String: %s\n", result); 
  
    free(result); 


}