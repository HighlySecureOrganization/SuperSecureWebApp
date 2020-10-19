##########################################################################
# Backup-Fortigate
# Filename: fortigate-backup.sh
# Revision: 1.0
# Date: 19/05/2020
# Author: Jihn Maia - john@redacted.com Telegram - @john

######################
# Credentials
######################
username='jmaia'
password='F0rtiG@t3'

###################################
# backup
###################################
curl -k -s -c /tmp/fortigate-backup.cookie -b /tmp/fortigate-backup.cookie -d "ajax=1&username=${username}&secretkey=${password}" "https://${IP}/logincheck" 
CSRF_TOKEN=$(curl -k -s -c /tmp/fortigate-backup.cookie -b /tmp/fortigate-backup.cookie "https://${IP}/system/maintenance/backup" 2>&1 | grep -o -E "([a-z|A-Z|0-9]{33}|[a-z|A-Z|0-9]{32}|[a-z|A-Z|0-9]{31}|[a-z|A-Z|0-9]{30}|[a-z|A-Z|0-9]{29}|[a-z|A-Z|0-9]{28}|[a-z|A-Z|0-9]{27})")
curl -k -s -c /tmp/fortigate-backup.cookie -b /tmp/fortigate-backup.cookie -d "backup_to=0&fname_back_usb=&backup=1&CSRF_TOKEN=${CSRF_TOKEN}" "https://${IP}/system/maintenance/backup"  -o "$FILENAME-$(date "+%d-%m-%Y").conf"

#################
# DEBUG
##################
#curl -k -s -c /tmp/fortigate-backup.cookie -b /tmp/fortigate-backup.cookie "https://${IP}/system/maintenance/backup" 
#curl -k -c /tmp/fortigate-backup.cookie -b /tmp/fortigate-backup.cookie    "https://${IP}/index" --insecure
#echo $CSRF_TOKEN
#echo "backup_to=0&fname_back_usb=&backup=1&CSRF_TOKEN=${CSRF_TOKEN}"
#echo "$FILENAME-$(date "+%d-%m-%Y").conf"