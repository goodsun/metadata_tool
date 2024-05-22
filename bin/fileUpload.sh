#!/bin/sh
source ../.env
FILENAME=`date "+%Y%m%d%H%M%S"`

echo "${AKORD_USER}にログイン";
LOGIN_OUTPUT=$(akord login ${AKORD_USER} -p ${AKORD_PASS} 2>&1 )
wallet_address=$(echo "$LOGIN_OUTPUT" | grep 'Your wallet address:' | awk -F': ' '{print $2}')
echo "Wallet Address: $wallet_address"


echo "${FILENAME}をアップロード";
CREATE_INFO=$(akord stack:create ${AKORD_VAULT} -p ${AKORD_FOLDER_ID} -n "${FILENAME}.jpg" -f "../datadir/dummy.jpg" 2>&1 )
CREATE_EXPURL=$(echo "$CREATE_INFO" | grep 'you can access your file on ViewBlock by visiting the following URL:' | awk -F': ' '{print $2}')
CREATE_TX=$(echo "$CREATE_INFO" | grep 'you can access your file on ViewBlock by visiting the following URL:' | awk -F'/tx/' '{print $2}')
echo "EXPURL: ${CREATE_EXPURL}"
echo "TX: ${CREATE_TX}"

akord stack:list ${AKORD_VAULT}

# echo "ログアウトさせるため${AKORD_DUMMY_USER}にログイン"
# akord login ${AKORD_DUMMY_USER} -p ${AKORD_DUMMY_PASS}
