#!/bin/bash


# Add Password が入力された場合
add_password(){
echo "サービス名を入力してください："
read service
echo "ユーザー名を入力してください："
read user
echo "パスワードを入力してください："
read password
echo "$service:$user:$password" >> password_file.txt
echo "パスワードの追加は成功しました。"
}

# Get Password が入力された場合
get_password(){
echo "サービス名を入力してください："
read service
password=$(grep "^$service" password_file.txt | cut -d: -f3)


## サービス名が保存されていた場合
if [ -n "$password" ]; then

echo "サービス名：$service"
echo "ユーザー名：$(grep "^$service" password_file.txt | cut -d: -f2)"
echo "パスワード：$password"

## サービス名が保存されていなかった場合
else
echo "そのサービスは登録されていません。"
fi
}


while true; do

echo "パスワードマネージャーへようこそ！"
echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
read choice

case $choice in
"Add Password")
add_password
;;
"Get Password")
get_password
;;
"Exit") # Exit が入力された場合
echo "Thank you!"
exit
;;
*)
echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
;;

esac
done
