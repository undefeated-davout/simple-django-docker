# 使い方
## Dockerコマンド
以下、simple-django-dockerディレクトリ直下にてコマンド実行

```
$ docker-compose build
$ docker-compose up -d
$ docker exec -it simple-django-docker_web_1 /bin/bash
# django-admin startproject testProject
# cd testProject
```

## 設定変更
testProject/settings.pyの下記行を修正する

```
# ALLOWED_HOSTS = []
# 上記記述を下記に修正
ALLOWED_HOSTS = ['0.0.0.0']
```

## サーバ起動

```
# python manage.py runserver 0.0.0.0:8000
```

## MySQLへ接続するには
下記コマンドで接続

```
$ mysql -uroot -p -h0.0.0.0 -P3316
```

もしくは下記接続情報でWorkbench等で接続
- ホスト：0.0.0.0
- ポート：3316
- ユーザ：root
- パスワード：pasword


## ブラウザで確認するには
ブラウザで下記アドレスに接続する
- http://0.0.0.0:8000/
