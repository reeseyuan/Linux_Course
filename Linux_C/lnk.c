#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <time.h>
extern int errno;
int main(int argc,char *argv[]){
	struct stat buf;
	open(argv[1],O_RDONLY);
	if((link(argv[1],argv[2]))==-1){
		printf("link error\n Errno NO.=%d\n",errno);
	}
	else
		printf("link success\n");

	if((symlink(argv[1],argv[3]))==-1){
		printf("symlink error\n Errno NO.=%d\n",errno);
	}
	else
		printf("symlink success\n");
        printf("stat比较：\n");
	stat(argv[2],&buf);//返回符号链接所指的文件的信息
	printf("%s size: %d\n",argv[2],buf.st_size);//文件大小
	printf("%s ino: %d\n",argv[2],buf.st_ino);//文件的索引节点号
	printf("%s dev: %d\n",argv[2],buf.st_dev);//文件所在设备号
	printf("%s change on %s",argv[2],ctime(&buf.st_mtime));//文件修改时间
	printf("%s: %o\n\n",argv[2],buf.st_mode);//文件权限

        stat(argv[3],&buf);//返回符号链接所指的文件的信息
	printf("%s size: %d\n",argv[3],buf.st_size);
	printf("%s ino: %d\n",argv[3],buf.st_ino);
	printf("%s dev: %d\n",argv[3],buf.st_dev);
	printf("%s change on %s",argv[3],ctime(&buf.st_mtime));
	printf("%s: %o\n\n",argv[3],buf.st_mode);
	
        printf("lstat比较：\n");
        lstat(argv[2],&buf);//返回符号链接本身的信息
	printf("%s size: %d\n",argv[2],buf.st_size);
	printf("%s ino: %d\n",argv[2],buf.st_ino);
	printf("%s dev: %d\n",argv[2],buf.st_dev);
	printf("%s change on %s",argv[2],ctime(&buf.st_mtime));
	printf("%s: %o\n\n",argv[2],buf.st_mode);

	lstat(argv[3],&buf);//返回符号链接本身的信息
	printf("%s size: %d\n",argv[3],buf.st_size);
	printf("%s ino: %d\n",argv[3],buf.st_ino);
	printf("%s dev: %d\n",argv[3],buf.st_dev);
	printf("%s change on %s",argv[3],ctime(&buf.st_mtime));
	printf("%s: %o\n\n",argv[3],buf.st_mode);	
}
