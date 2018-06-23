#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <time.h>
int main(int argc,char* argv[]) {
	struct stat buf;
	link(argv[1],argv[2]); 
	unlink(argv[1]); 
	printf("finish\n"); 
	stat(argv[1],&buf);
	printf("%s size: %d\n",argv[1],buf.st_size);
	printf("%s ino: %d\n",argv[1],buf.st_ino);
	printf("%s change on %s\n",argv[1],ctime(&buf.st_mtime));
	
	stat(argv[2],&buf);
	printf("%s size: %d\n",argv[2],buf.st_size);
	printf("%s ino: %d\n",argv[2],buf.st_ino);
	printf("%s change on %s",argv[2],ctime(&buf.st_mtime));
	return 0; 
}
