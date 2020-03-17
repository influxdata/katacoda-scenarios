**InfluxDB 2.0 is currently in beta and we do not recommend using these instructions as a basis for any production workloads.**

InfluxDB can be run as a Docker container using our Docker image that is distributed on Quay.io.

InfluxDB 2.0 ships with a UI, available on port 9999.

The following command spins up an InfluxDB v2 container. It **does not** persist data across runs, so we do not recommend restarting this container.

```
INFLUXDB_CID=$(docker container run --detach --publish "19999:9999" quay.io/influxdb/influxdb:2.0.0-beta)
```{{execute}}

## Configuring InfluxDB Authentication

Authentication cannot be disabled with InfluxDB v2, so we also need to configure our organisation and user.

**Warning:** If this returns an error, please wait 5 seconds and try again. It needs InfluxDB to be healthy before it configures it.

```
docker container exec -it ${INFLUXDB_CID} influx setup --org influxdata --bucket default --username doc --password einstein --token mcfly --force
```{{execute}}

You'll need the username and password for accessing the UI, so take a note of them:

* **Username:** doc
* **Password:** einstein

## Accessing the InfluxDB v2 UI

Now that you've run InfluxDB and configured the authentication, you are free to browse to the [dashboard](https://[[HOST_SUBDOMAIN]]-19999-[[KATACODA_HOST]].environments.katacoda.com/); and begin your challenge.
