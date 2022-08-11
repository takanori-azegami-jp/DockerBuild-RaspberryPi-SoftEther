# DockerBuild-RaspberryPi-SoftEther
RaspberryPi(64bit)にDockerでSoftEtherをVPN環境を構築

## 環境
- kernel：Linux ホスト名 5.15.32-v8+ #1538 SMP PREEMPT Thu Mar 31 19:40:39 BST 2022 aarch64 GNU/Linux
- OS：Debian GNU/Linux 11 (bullseye)

## 変更点
- 設定は「softEther VPN サーバー管理マネージャ」をインストールして行う<br>
  ※docker buildする度に「DDNS」が変更するので注意
- 内部ポート：5555のみ
- 外部ポート：500、4500
- 30日より古いログはcron.dailyのシェルで日次で削除

## Dockerコマンド
```bash
# Docker-compose実行
$ docker-compose up -d

# Docker コンテナ確認
$ docker ps

# Docker イメージ確認
$ docker images

# Docker コンテナの中に入る
$ docker exec -it [コンテナID] bash

# dokcer-composeのリビルド
$ docker-compose up -d --build  --force-recreate

# dokcer-composeの一括削除（滅びの呪文）
$ docker-compose down --rmi all --volumes --remove-orphans
```

## 参考サイト
- [siomiz/softethervpn](https://github.com/siomiz/SoftEtherVPN)
- [`siomiz/softethervpn` を利用して SoftEther server を構築した際に、DDNS設定が上書きされる](https://zenn.dev/rhene/scraps/a71de99611ca97)
- [Alpine Linuxにvpnを入れる](https://saturday-in-the-park.netlify.app/AlpineLinux/07_vpn/)

## ライセンス
- [MITライセンス](https://licenses.opensource.jp/MIT/MIT.html)
