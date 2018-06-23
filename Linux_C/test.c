#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#define BUFFSIZE 1024
extern int errno;
int main(int argc,char* argv[]){
	int fd1,fd2,fd3;
	int n;
	char buf[BUFFSIZE];
	if((fd1=open(argv[1],O_RDONLY))<0){
		printf("%s not exist\n",argv[1]);
		exit(0);
	}
	if((fd2=open(argv[2],O_RDONLY))<0){
		printf("%s not exist\n",argv[2]);
		exit(0);
	}
	if((fd3=open(argv[3],O_CREAT|O_EXCL|O_RDWR,S_IRWXU))==-1){
		printf("Create Error. Error Number is %d\n",errno);
		if(errno==EEXIST){
			printf("%s is already exist.\n",argv[3]);
			fd3=open(argv[3],O_TRUNC|O_WRONLY,0644);
		}
	}else{
		printf("Create %s success\n",argv[3]);
	}
	while((n=read(fd1,buf,BUFFSIZE))>0){
		write(fd3,buf,n);
	}
	lseek(fd3,30,SEEK_END);
	while((n=read(fd2,buf,BUFFSIZE))>0){
		write(fd3,buf,n);
	}
	close(fd1);
	close(fd2);
	close(fd3);
	return 0;
}
