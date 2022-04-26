## 概要

terraform で EC2 Mac インスタンスを作成する。

## 特徴

インスタンス起動時に user_data.sh を実行し、以下の設定を行っている。

* Remote Management (VNC) を起動
* ホスト名を設定
* ec2-user のデスクトップ背景画像を変更
* iterm2 をインストール
