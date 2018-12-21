#!/bin/sh

unzip -o -qq original.ZIP

ls | grep -v "ZIP$" | grep -v "xploit.sh" | while read line;
do
	mv $line $line.zip
done


