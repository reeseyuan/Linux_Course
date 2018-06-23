#!/bin/sh
# menu
MYDATE=`date +%d/%m/%Y`
THIS_HOST=`hostname`
USER=`whoami`
CHOICE=''
pause(){
echo "press enter to continue"
read CHOICE
}
while :
do
tput clear
cat <<EOF
————————————————————————————————————————————————————————————————————————————————
User:$USER                   Host:$THIS_HOST               Date:$MYDATE
————————————————————————————————————————————————————————————————————————————————
                A:创建子目录并复制文件
                B:文件权限测试
                C:文件字符转换
                D:文件总数及文本行数统计
                E:文件查找
                Q:退出系统
————————————————————————————————————————————————————————————————————————————————
EOF
echo "		请输入你想要进行的操作:"
read CHOICE
case $CHOICE in
  a|A)
  cd /home/reese/yrs
  mkdir yrstest
  if(test -d "yrstest")
  then
    chmod 755 yrstest/
    cp /home/reese/yrs/文件1 yrstest/file1
    cp /home/reese/yrs/文件2 yrstest/file2
    cd yrstest
    cat file*
    truncate -s 0 file1
    truncate -s 0 file2
    pause
  fi
  ;;
  b|B)
  echo "当前路径为:`pwd`，请输入文件的路径"
  read ADDRESS
  if(test -f $ADDRESS)
  then
    if(test -r $ADDRESS)
    then
      R="存在"
    else
      R="不存在"
    fi
    if(test -w $ADDRESS)
    then
      R="存在"
    else
      R="不存在"
    fi
    if(test -x $ADDRESS)
    then
      R="存在"
    else
      R="不存在"
    fi
    echo "当前用户对文件 $ADDRESS 读取权限$R 写入权限$W 执行权限$X"
  else
    echo "文件不存在，测试失败"
  fi
  pause
  ;;
  c|C)
  cd /home/reese/yrs/
  cat 文件1|tr 'a-z' 'A-Z' >1
  cat 文件2|tr 'a-z' 'A-Z' >2
  cat 1
  cat 2
  pause
  ;;
  d|D)
  cd /dev
  echo "目录文件有`ls -l |grep "^d"|wc -l`个"
  echo "链接文件有`ls -l |grep "^l"|wc -l`个"
  echo "显示系统中所有的环境变量"
  env
  cd /home/reese/yrs
  echo "当前路径为:`pwd`，请输入文件的路径"
  read ADDRESS
  echo "$ADDRESS 的空行数有`grep "^$" $ADDRESS|wc -l`"
  pause
  ;;
  e|E)
  cd /dev
  if (test `ls s????`)
  then
    FILENAME=`ls s????`
    file $FILENAME
    pause
  else
    echo "未找到该类型文件"
  fi
  ;;
  q|Q)
  exit
  ;;
  *)
esac
done
