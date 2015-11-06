#!/bin/bash

scp -r _build webelement.sk@webelement.sk:/new
echo "rename web web-`date +"%Y%m%d-%H%M%S"`" | sftp -C webelement.sk@webelement.sk
echo "rename new web" | sftp -C webelement.sk@webelement.sk