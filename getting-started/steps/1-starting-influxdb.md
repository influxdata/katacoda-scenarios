# Starting InfluxDB

**InfluxDB 2.0 is currently in alpha and we do not recommend using these instructions as a basis for any production workloads.**

InfluxDB can be run as a Docker container using our pre-built alpha Docker image, available on Quay.io. InfluxDB 2.0 ships with a UI, available on port 9999.

## Running InfluxDB

First, lets create a directory on the host to persist our InfluxDB data.

```
# Lets make a directory to persist our data
mkdir -p /influxdb/data
```{{execute}}

Next, we'll create a Docker network so that our InfluxDB container can be contacted by some extra containers later.

```
docker network create influxdb
```{{execute}}

The following Docker command spins up an InfluxDB 2.0 container, which persists data in `/root/.influxdbv2`, and is mapped back to the host on the directory we created earlier.

```
docker run -d \
    --volume "/influxdb/data:/root/.influxdbv2" \
    --publish "19999:9999" \
    --network "influxdb" \
    --name "influxdb" \
    quay.io/influxdb/influxdb:2.0.0-alpha
```{{execute}}

Once started, the [dashboard](https://[[HOST_SUBDOMAIN]]-19999-[[KATACODA_HOST]].environments.katacoda.com/) is viewable on port [9999](https://[[HOST_SUBDOMAIN]]-19999-[[KATACODA_HOST]].environments.katacoda.com/). The next steps will explain the details and how to view the data.

## Configuring InfluxDB Authentication

Authentication cannot be disabled with InfluxDB 2.0, so we also need to configure our organisation and user.

```
docker container run \
    --network "influxdb" \
    quay.io/influxdb/influxdb:2.0.0-alpha \
    influx setup --host "http://influxdb:9999" --org bigcorp --bucket default --username p.dix --password einstein --token backtothefuture --force
```{{execute}}
