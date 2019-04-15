# Starting InfluxDB

**InfluxDB 2.0 is currently in alpha and we do not recommend using these instructions as a basis for any production workloads.**

InfluxDB can be run as a Docker container using our pre-built alpha Docker image, available on Quay.io. InfluxDB 2.0 ships with a UI, available on port 9999.

## Task

The following Docker command spins up an InfluxDB 2.0 container, which persists data in `/root/.influxdbv2`.

```
mkdir -p /influxdb/data

docker run -d \
    -v /influxdb/data:/root/.influxdbv2 \
    -p 9999:9999 \
    quay.io/influxdb/influxdb:2.0.0-alpha
```{{execute}}

Once started, the [dashboard](https://[[HOST_SUBDOMAIN]]-9999-[[KATACODA_HOST]].environments.katacoda.com/) is viewable on port [9999](https://[[HOST_SUBDOMAIN]]-9999-[[KATACODA_HOST]].environments.katacoda.com/). The next steps will explain the details and how to view the data.
