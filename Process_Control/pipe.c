#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>
#define BUFFSIZE 1024
int main(int argc,char* argv[]){
	char buf[BUFFSIZE];
	int n;
	int state=0;
	int fd[2],pid;
	if(pipe(fd)==-1){
		printf("creat pipe error\n");
	}
	pid=fork();
	if(pid>0){
		close(fd[0]);
		printf("this is father process\n");
		n=read(STDIN_FILENO,buf,BUFFSIZE);
		write(fd[1],buf,n);
		close(fd[1]);
		}
	else if(pid==0){
		printf("this is child process\n");
		close(fd[1]);
		n=read(fd[0],buf,BUFFSIZE);
		write(STDIN_FILENO,buf,n);
		close(fd[0]);
	}else{
		printf("error\n");			
	}
				
}
