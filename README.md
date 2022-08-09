# DockerBuild-RaspberryPi-SoftEther_my
RaspberryPi(64bit)にDockerでSoftEtherを構築

## 環境
- kernel：Linux ホスト名 5.15.32-v8+ #1538 SMP PREEMPT Thu Mar 31 19:40:39 BST 2022 aarch64 GNU/Linux
- OS：Debian GNU/Linux 11 (bullseye)

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

# dokcer-composeの一括削除（滅びの呪文）
$ docker-compose down --rmi all --volumes --remove-orphans
```

## 参考サイト
- [siomiz/softethervpn](https://github.com/siomiz/SoftEtherVPN)
- [Alpine Linuxにvpnを入れる](https://saturday-in-the-park.netlify.app/AlpineLinux/07_vpn/)


## ライセンス
- [MITライセンス](https://licenses.opensource.jp/MIT/MIT.html)

