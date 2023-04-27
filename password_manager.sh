#!/bin/bash


EMAIL="ara.ct0619@gmail.com"
FILE_PATH="$HOME/encrypted_passwords.gpg"


while true; do
  echo "パスワードマネージャーへようこそ！"
  read -p "次の選択肢から入力してください(1.Add Password/2.Get Password/3.Exit)：" choice

  if ((choice == 1)); then
    read -p "サービス名を入力してください：" service
    read -p "ユーザー名を入力してください：" username
    read -sp "パスワードを入力してください：" password
    echo -e "\n${service}, ${username}, ${password}" | gpg --encrypt -r "${EMAIL}" >> "${FILE_PATH}"
    echo -e "\nパスワードの追加に成功しました。"
  elif ((choice == 2)); then
    read -p "サービス名を入力してください：" service
    gpg --decrypt "${FILE_PATH}" 2>/dev/null | grep -i "${service}"
  elif ((choice == 3)); then
    echo "Thank you!"
    break
  else
    echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
  fi
done
