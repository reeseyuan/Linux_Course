#!/bin/bash
while :
do
tput clear
cat <<EOF
————————————————————————————————
       个性化文件搜索工具
         1:grep搜索工具
         2:find搜索工具
         3:退出工具
————————————————————————————————
选择想要使用的工具[1|2|3]:
EOF
read choice1
if [ "$choice1" == "1" ] #选择grep
then 
	echo "1:默认查找目录(/dev)"
	echo "2:自定义查找目录" 
read choice11
if [ "{$choice11}" == "{1}" ] 
then
	ls /dev > devf
	echo "1:查找以匹配模式开头的文件"
	echo "2:查找不包含匹配模式的文件"
	echo "3:查找以匹配模式结尾并且长度固定的文件"
read CHOICE1
case $CHOICE1 in
	1)echo "请输入匹配模式"
	  read moshi
		grep -E ^$moshi devf
;;
	2)echo "请输入匹配模式"
	  read moshi
		grep -Ev $moshi devf
;;
	3)echo "请输入匹配模式"
	  read moshi
	  echo "请输入文件长度"
	  read len
          rlen=$(($len-`echo ${#moshi}`))
	  grep -xE [[:alnum:]]\{$rlen\}$moshi devf
;;
esac

else
	echo "请输入查找目录:"
	read mulu
	ls $mulu > devf
	echo "1:查找以匹配模式开头的文件"
	echo "2:查找不包含匹配模式的文件"
	echo "3:查找以匹配模式结尾并且长度固定的文件"
read CHOICE1
case $CHOICE1 in
	1)echo "请输入匹配模式"
	  read moshi
		grep -E ^$moshi devf
;;
	2)echo "请输入匹配模式"
	  read moshi
		grep -Ev $moshi devf
;;
	3)echo "请输入匹配模式"
	  read moshi
	  echo "请输入文件长度"
	  read len
          rlen=$(($len-`echo ${#moshi}`))
	  grep -xE [[:alnum:]]\{$rlen\}$moshi devf
;;
esac

fi
elif [ "$choice1" == 2 ] #选择find
then
	echo "1:默认查找目录(/dev)"
	echo "2:自定义查找目录" 
read choice11
if [ "{$choice11}" == "{1}" ] 
then
	ls /dev > devf
	echo "1:查找文件大小大于给定下限的文件"
	echo "2:查找给定时间(单位：天)内修改过的文件"
	echo "3:查找给定时间(单位：分钟)内修改过的文件"
	echo "4:查找给定文件后缀的文件"
read CHOICE1
case $CHOICE1 in
	1)echo "请输入文件大小下限值(k)"
	  read size
	  find /dev -size +$size 
		
;;
	2)echo "请输入时间(day)"
	  read time
	  find /dev -mtime -$time
		
;;
	3)echo "请输入时间(min)"
	  read min
	  find /dev -mmin +$min 
		
;;
	4)echo "请输入文件后缀名称"
	  read houzhui
	  find /dev -name *.$houzhui 
	
		
;;
esac
else
	echo "请输入查找目录:"
	read mulu
	echo "1:查找文件大小大于给定下限的文件"
	echo "2:查找给定时间(单位：天)内修改过的文件"
	echo "3:查找给定时间(单位：分钟)内修改过的文件"
	echo "4:查找给定文件后缀的文件"
read CHOICE1
case $CHOICE1 in
	1)echo "请输入文件的大小"
	  read size
	  find $mulu -size +$size 
		
;;
	2)echo "请输入时间(以day作为单位)"
	  read time
	  find $mulu -mtime +$time 
		
;;
	3)echo "请输入时间(以min作为单位)"
	  read min
	  find $mulu -mmin +$min 
		
;;
	
	4)echo "请输入文件后缀名称"
	  read houzhui
	  find $mulu -name *.$houzhui
;;
esac

fi

elif [ "$choice1" == 3 ]
then
break

fi
done
