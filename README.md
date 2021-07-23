# microros_ws_docker

## Overview

micro-ROSワークスペースを作成するDocker環境を作成します。  
ターゲット別にディレクトリを複製することでホスト環境を汚さずに複数の環境を管理可能です。  

## 動作環境
次の環境でのみ動作を確認しています。

- Ubuntu 20.04 
- Docker 20.10.7
- ROS 2 Foxy Fitzroy

## Install

- Docker環境を構築してください
- 空き容量が十分な場所に次のコマンドでこのパッケージをCloneして下さい  
`git clone https://github.com/nomumu/microros_ws_docker.git`  
- 次のコマンドでDockerイメージを作成して下さい  
`docker build . -t microros_ws_foxy`  

## 実行

- `target`ディレクトリを作成したいターゲットの名前でコピーして下さい  
```
microros_ws_docker$ cp target example -ar
```  
- 作成したターゲットのディレクトリへ移動し、Docker環境実行コマンドを実行して下さい  
```
microros_ws_docker$ cd example
microros_ws_docker/example$ ./run.sh
```  
- Dockerコンテナ内では実行したユーザと同じ権限で作業を行います  
- `~/colcon_ws`の内容はターゲットディレクトリへ保存されます  
