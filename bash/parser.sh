#!/bin/bash
for i in "$@"
do
case $i in
	--option-1=*)
	option_1="${i#*=}"
	shift
	;;
	--option-2=*)
	option_2="${i#*=}"
	shift
	;;
	*)
  # unknown option
	;;
esac
done
echo $option_1
echo $option_2
# https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
