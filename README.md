## Requirements
- docker

## 使い方
#### 起動
```
$ docker compose up -d
```

#### メッセージ送受信
```
# メッセージの受信
# Exclusive
$ docker exec -it east-client bin/pulsar-client consume -s sub -n 0 persistent://my-prop/my-ns/topic1

# Failover
$ docker exec -it east-client bin/pulsar-client consume -s sub -n 0 -t Failover persistent://my-prop/my-ns/topic1

# Shared
$ docker exec -it east-client bin/pulsar-client consume -s sub -n 0 -t Shared persistent://my-prop/my-ns/topic1

# メッセージの送信（別ターミナルで実行）
$ docker exec -it east-client bin/pulsar-client produce -m 'message' -n 10 persistent://my-prop/my-ns/topic1
```

`persistent://my-prop/my-ns/topic1` はgeo-replicationを設定済み
```
# eastで受信
$ docker exec -it east-client bin/pulsar-client consume -s sub -n 1 -t Shared persistent://my-prop/my-ns/topic1

# westで受信（別ターミナルで実行）
$ docker exec -it west-client bin/pulsar-client consume -s sub -n 1 -t Shared persistent://my-prop/my-ns/topic1

# eastから送信（別ターミナルで実行）
# east, west両方のconsumerに送られる
$ docker exec -it east-client bin/pulsar-client produce -m 'message' -n 1 persistent://my-prop/my-ns/topic1
```

#### 終了
```
$ docker compose down
```

## 備考
containerの起動に失敗するときはメモリ割り当てを増やすと成功する可能性があります
