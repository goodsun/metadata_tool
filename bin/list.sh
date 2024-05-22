#!/bin/sh
source ../.env
FILENAME=`date '+%Y%m%d%H%M%S'`
FILELIST=$(akord stack:list ${AKORD_VAULT} 2>&1 )


echo "$FILELIST" | \
awk 'BEGIN {FS="│"; OFS=":"}
     /├─────────/ {flag=1; next}
     /└─────────/ {flag=0}
     flag && /│/ {gsub(/^[ \t]+|[ \t]+$/, "", $3); gsub(/^[ \t]+|[ \t]+$/, "", $4); print $3, $4}' | \
sed "s/'//g"

