#!/bin/bash

DATETIME=`date +"%Y%m%d-%H%M%S"`
ARCHIVE="build-$DATETIME.tar.gz"
SCRIPT="build-$DATETIME.sh"

mv _build.tar.gz $ARCHIVE
touch $SCRIPT && chmod +x $SCRIPT

echo "#!/bin/bash
cd ~/web/webelement.sk
rm -rf _build
echo \"Extracting archive ...\"
tar -xzf $ARCHIVE
mv _build webelement.sk-$DATETIME
rm web && ln -s webelement.sk-$DATETIME web
" > $SCRIPT

scp -r $ARCHIVE $SCRIPT webelement@webelement.sk:~/web/webelement.sk
ssh webelement@webelement.sk "~/web/webelement.sk/$SCRIPT"
