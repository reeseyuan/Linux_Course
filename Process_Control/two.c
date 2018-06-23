#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/wait.h>
int main(int argc,char *argv[]){
	pid_t pid1;
	pid_t pid2;
	pid1=fork();
	if(pid1==0){
		printf("Son pid: %d ppid: %d\n",getpid(),getppid());
	}else if(pid1>0){
		wait(0);
		pid2=fork();
		if(pid2==0){
			printf("Daughter pid: %d ppid: %d\n",getpid(),getppid());
		}else if(pid2>0){
			wait(0);
			printf("Father pid: %d\n",getpid());
		}
	}
	return 0;
}
