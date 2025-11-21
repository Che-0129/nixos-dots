# NixOSインストール

## rootユーザーに変更
```
$ sudo -i
```

## 日本語キーボードに変更
```
# loadkeys jp106
```

## Wi-Fiに接続
```
# nmtui
```

## パーティション切り
```
# sgdisk -Z /dev/nvme0n1
# sgdisk -n 1::+1G -n 2:: -t 1:ef00 -t 2:8304 /dev/nvme0n1
```

## フォーマット
```
# mkfs.fat -F 32 /dev/nvme0n1p1
# mkfs.btrfs /dev/nvme0n1p2
```

## マウント
```
# mount /dev/nvme0n1p2 /mnt
# mount -m /dev/nvme0n1p1 /mnt/boot
```

## configuration.nix等を生成
```
# nixos-generate-config --root /mnt
```

## configuration.nixを編集
```
# nano /mnt/etc/nixos/configuration.nix
```

## インストール
```
# nixos-install
```
