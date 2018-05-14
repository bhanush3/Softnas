# Custom Script for Linux
#APPDIR=/var/www/softnas
#APICMD=$APPDIR/api/softnas-cmd

#$APICMD login softnas Pass@1234567

#$APICMD createpool /dev/sdc myPOOL1 0 on -t

USERN=$1
PASSW=$2
POOLNAME=$3
VOLNAME=$4
APPDIR=/var/www/softnas
APICMD=$APPDIR/api/softnas-cmd

$APICMD login $USERN $PASSW
$APICMD parted_command add_partition /dev/sdc
$APICMD createpool /dev/sdc $POOLNAME 0 on -t
$APICMD createvolume vol_name=$VOLNAME pool=$POOLNAME vol_type=filesystem provisioning=thin exportNFS=on shareCIFS=on dedup=on enable_snapshot=on schedule_name=Default hourlysnaps=5 dailysnaps=10 weeklysnaps=0
