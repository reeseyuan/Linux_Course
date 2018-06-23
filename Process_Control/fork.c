#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/wait.h>
int main(int argc,char *argv[]){
	pid_t pid;
	int i=1,rs=0;
	pid=fork();
	if(pid==0){
		printf("This is child process\n");
                system("cat file1|more");
		execl("/bin/ls","ls","-l",0);
		perror("execl error");
		exit(1);
	}else if(pid>0){
		wait(0);
		printf("This is parent process\n");
		for(i;i<101;i++)
			rs+=i;
		printf("%d\n",rs);
		system("cat file2|more");
	}else
		printf("fork failed\n");
	printf("program end\n");
	return 0;
}
