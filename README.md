## 概要

terraform で EC2 Mac インスタンスを作成する。

## 特徴

インスタンス起動時に user_data.sh を実行し、以下の設定を行っている。

* Remote Management (VNC) を起動
* ホスト名を設定
* ec2-user のデスクトップ背景画像を変更
* iterm2 をインストール

## 使い方

* ssh 鍵を生成する。

```
ssh-keygen -t rsa -f mac
```

* terraform.tfvars を修正する。ssh 公開鍵などを登録する。

* AWS 環境を構築する。

```
terraform apply
```

* ssh でログインする。

```
ssh -L 5900:localhost:5900 -i mac ec2-user@REMOTE_IP
```

* Remote Management (VNC サーバ) を有効化する。

```
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart \
-activate \
-configure -access -on -privs -all \
-restart -agent
```

* ec2-user ユーザにパスワードを設定する。

```
sudo dscl . -passwd /Users/ec2-user
```

* Finder > 「移動」メニュー > サーバに接続を選択し、以下の URL を入力する。

```
vnc://127.0.0.1:5900
```

以下の ユーザ, パスワードでログインする。
* ユーザ: ec2-user
* パスワード: 自分で設定したパスワード
