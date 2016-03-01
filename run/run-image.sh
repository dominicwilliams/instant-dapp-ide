SRC=~/src
KEYS=`pwd`"/ssh"
MSG="\n\
1. Setup file mappings: \n\
 Source code: $SRC to /src \n\
 Public keys of pair programmers: $KEYS/authorized_keys to /root/.ssh/authorized_keys \n\
\n\
2. Booting instant-dapp-ide instance...\n"
echo -e $MSG
docker run -v ${SRC}:/src -v ${KEYS}:/root/.import -i -p 2222:2222 -p 8080:8080 -p 8181:8181 -p 8545:8545 -t dominicwilliams/instant-dapp-ide:latest

