#!/bin/bash

D=`find . -mindepth 1 -maxdepth 1 -type d | cut -d'/' -f2 | sort | tail -1`
# refer to: http://www.cnblogs.com/chengyeliang/p/5264526.html
(( D=10#$D + 1 ))
if [ $D -gt 999 ]
then
    echo 'Max Limit 999'
    exit -1
fi

Dname=`printf '%.3d' $D`
mkdir $Dname
cd $Dname
touch index.css
touch index.js
cat >> index.html << eof
<!doctype html>
<html>
    <head>
        <script src="https://cdn.bootcss.com/d3/4.13.0/d3.min.js"></script>
    </head>
    <body>
        <div id='app'></div>
        <script src='index.js'></script>
    </body>
</html>

eof

echo Done
echo -e "Please \033[0;36mcd \033[0;33m$Dname\033[0m and finish remainings"
