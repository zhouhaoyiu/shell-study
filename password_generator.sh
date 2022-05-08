#!/bin/bash
flag=false
for i in $*
do
  if [ ${i} == "-w" ]
  then
  echo "Warning: password will be saved in log/password.txt"    
  flag=true
  fi
done
#随机生成n位随机密码
  
#定义密码取值范围
String="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
echo "请输入要生成的密码位数"
read -p "位数：" n
echo "请输入密码用途"
read -p "用途：" usage
#循环n次
for ((i=0;i<n;i++))
do
#随机取值
    num=$[$RANDOM%${#String}]
    passwd=$passwd${String:$num:1}
done
echo "您的密码是：$passwd"
if [ ${flag} == true ]
then
  echo "password：$passwd length: $n used by $usage created $(date "+%Y-%m-%d %H:%M:%S")" >> log/password.txt
fi