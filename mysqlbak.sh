#!/bin/bash
while true
    do
        datedir=/opt/mysqlbak/`date +%Y-%m-%d-%T`
        mysqldb=user
        mysqluser=root
        mysqlpw=123456
        if
            [ ! -d $datedir ];then
            mkdir -p $datedir
        fi
            mysqldump -u$mysqluser -p$mysqlpw --databases $mysqldb > $datedir/$mysqldb.sql
        if
            [ $? -ne 0 ];then
            echo "error"
            sleep 1
            exit 0
        fi
        cd $datedir
        find . -mtime +7 | xargs rm -rf
	sleep 30
done
