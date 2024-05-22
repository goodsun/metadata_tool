#!/bin/sh
source ../.env
login_output=$(akord login ${AKORD_USER} -p ${AKORD_PASS} 2>&1 )

# 各種ウォレット情報を抽出
wallet_path=$(echo "$login_output" | grep 'Your wallet was stored at:' | awk -F': ' '{print $2}')
wallet_address=$(echo "$login_output" | grep 'Your wallet address:' | awk -F': ' '{print $2}')
wallet_public_key=$(echo "$login_output" | grep 'Your wallet public key:' | awk -F': ' '{print $2}')
wallet_signing_public_key=$(echo "$login_output" | grep 'Your wallet signing public key:' | awk -F': ' '{print $2}')

# 抽出した情報を表示
echo "Wallet Path: $wallet_path"
echo "Wallet Address: $wallet_address"
echo "Wallet Public Key: $wallet_public_key"
echo "Wallet Signing Public Key: $wallet_signing_public_key"
