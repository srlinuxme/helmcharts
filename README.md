# [Peertube](https://github.com/Chocobozzz/PeerTube) on kubernetes

Federated (ActivityPub) video streaming platform using P2P (BitTorrent) directly in the web browser with WebTorrent.

---

## Status : WIP but workable

- [x] Run Peertube and Redis
- [x] Use pvc to persist data
- [ ] Improve readme for deployment

## Before deploying

Currently if you want use persistent volume you need to create persistent volume and persistent volume claim. You may use sample claims from `sample`:
 - change the storageclass from `ChangeMeStorageClass` to your correct class
 - apply the claim: `kubectl apply -f sample/claim.pvc-pt.yml`

### Postgres
You need a postgresql server.
If you know what you are doing and want to store postgres in Kubernetes, I suggest [postgres-operator](https://access.crunchydata.com/documentation/postgres-operator/5.1.1/) from CrunchyData

### You also need a redis

From peertube helm v1.5.0, redis is no more provided inside the chart. Indeed peertube does not handle anymore redis 3.3, so I advice installing and managing redis outside the chart like postgres cluster.

I suggest using [bitnami redis](https://github.com/bitnami/charts/tree/master/bitnami/redis) with `architecture=standalone` to avoid uneeded slave (Peertube only need master)

Once installed, use following values to pass needed info to your peertube instance.
```
redisHostname
redisAuth
```
## Installing this chart (Srlinuxme maintainer)
`$ helm repo add peertube https://github.com/srlinuxme/helm-charts/tree/f5e388e1794cc912348dd1bc9acbf87dfe25e02e/peertube`
## Installing the chart

`$ helm install --name my-release .`

Specify each parameter using the --set key=value[,key=value] argument to helm install. For example,

```
$ helm install --name my-release \
  --set environment.hostname=new.domain.tld,\
  postgresql.postgresPassword=secretpassword \
  .
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

`$ helm install --name my-release -f values.yaml .`

See the sample/values.yml for example of values to use

## Source

Originated from https://github.com/MikaXII/helm-charts
Thanks!

## My own maintained
My own: https://github.com/srlinuxme/helm-charts/peertube
