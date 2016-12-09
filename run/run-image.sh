SRC=~/src
KEYS=`pwd`"/ssh"
if [ -f $KEYS/authorized_keys ]
then
	echo "$KEYS/authorized_keys found..."
else
	echo "Creating $KEYS/authorized_keys..."
	cp $KEYS/authorized_keys.example $KEYS/authorized_keys
fi
MSG="\n\
1. Setup file mappings: \n\
 Source code: $SRC to /src \n\
 Public keys of pair programmers: $KEYS/authorized_keys copied to /root/.ssh/authorized_keys \n\
\n\
2. Booting instant-dapp-ide instance...\n\
- SSH on port 2222\n\
- Dapp served on port 8080\n\
- Cloud9 IDE served on port 8181\n\
- Ethereum RPC served on port 8545\n"
echo -e $MSG
docker run -v ${SRC}:/src -v ${KEYS}:/root/.import -i -p 2222:2222 -p 8080:8080 -p 8181:8181 -p 8545:8545 -t dominicwilliams/instant-dapp-ide:latest

