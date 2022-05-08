#!/bin/bash
flag=false
easy=false
for i in $*
do
  if [ ${i} == "-s" ]
  then
      echo -e '\033[47;30m'"Warning: password will be saved in log/password.txt"'\033[0m'
      flag=true
  fi
  if [ ${i} == "-e" ]
  then
      echo -e '\033[41;37m'Info: I will generate an easy password '\033[0m'
      easy=true
  fi
done
#随机生成n位随机密码
  
#定义密码取值范围
if [ $easy = true ]
then
    String="0123456789abc"
else
    String="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
fi
echo "请输入要生成的密码位数(0到20)"
read -p "位数：" n
if [ ${n} -le 20 ] && [ ${n} -gt 0 ]
then
    echo "请输入密码用途"
else
    echo "输入错误"
    exit 0
fi
read -p "用途：" usage

echo -e '\033[0;42m'  Password Generating  '\033[0m'
#循环n次
for ((i=0;i<n;i++))
do
#随机取值
    num=$[$RANDOM%${#String}]
    passwd=$passwd${String:$num:1}
done
echo "您的密码是：$passwd, 用途：$usage"
if [ ${flag} == true ]
then
  if [ ! -d log ]
  then
    mkdir log
  fi
  echo "password：$passwd length: $n used by $usage created $(date "+%Y-%m-%d %H:%M:%S")" >> log/password.txt
fi