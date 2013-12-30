#!/bin/sh
#set -x

#####Server 1
enable_srv1='Number1'
login_srv1='Number2'
pass_srv1='Number3'
type='pass_'
eval srv=srv1${type}_
echo $srv

echo "#################"

first_var='Number1'
second_var='Number2'
third_var='Number3'
type='second'
eval new_var=\$${type}_var
echo $new_var




