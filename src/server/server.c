#include <stdio.h> // include i/o and file handling
#include <stdlib.h> //general purpose standard library
#include <sys/socket.h> // include protocol families

int main(){
    const int PORT = 6969;
    const int sockfd = socket(AF_INET6,SOCK_STREAM,0);
}
