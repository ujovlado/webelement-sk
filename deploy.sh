#!/bin/bash

DATETIME=`date +"%Y%m%d-%H%M%S"`;

scp -r _build webelement.sk@webelement.sk:/new-$DATETIME
echo -e "rename web web-$DATETIME\nrename new-$DATETIME web" | sftp -C webelement.sk@webelement.sk