## Requirements
- docker

## Usage
#### Start
```
$ docker compose up -d
```

#### Produce/Consume
```
# Consume
# Exclusive Subscription
$ docker exec -it east-client bin/pulsar-client consume -s sub -n 0 persistent://my-prop/my-ns/topic1

# Failover Subscription
$ docker exec -it east-client bin/pulsar-client consume -s sub -n 0 -t Failover persistent://my-prop/my-ns/topic1

# Shared Subscription
$ docker exec -it east-client bin/pulsar-client consume -s sub -n 0 -t Shared persistent://my-prop/my-ns/topic1

# Produce (another terminal)
$ docker exec -it east-client bin/pulsar-client produce -m 'message' -n 10 persistent://my-prop/my-ns/topic1
```

`persistent://my-prop/my-ns/topic1` has already confiured geo-replication.
```
# Consume from east cluster
$ docker exec -it east-client bin/pulsar-client consume -s sub -n 1 -t Shared persistent://my-prop/my-ns/topic1

# Consume from west cluster (other terminal)
$ docker exec -it west-client bin/pulsar-client consume -s sub -n 1 -t Shared persistent://my-prop/my-ns/topic1

# Produce from east cluster (other terminal)
# Send to east and west Consumer
$ docker exec -it east-client bin/pulsar-client produce -m 'message' -n 1 persistent://my-prop/my-ns/topic1
```

#### Stop
```
$ docker compose down
```

## Note
This containers require a large amount of memory.
