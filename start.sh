#!/bin/sh

# start the virtuoso service
echo "starting virtuoso …"
service virtuoso-opensource-6.1 start

# start the php5-fpm service
echo "starting php …"
service php5-fpm start

# start the nginx service
echo "starting nginx …"
service nginx start

echo "Xodx is ready to set sail!"
cat /xodx-docker.fig
echo ""
echo "following log:"

CACHEDIR=/var/www/cache/
mkdir $CACHEDIR
chmod a+w $CACHEDIR

LOG="/var/www/xodx.log"
touch $LOG
chmod a+w $LOG
tail -f $LOG
