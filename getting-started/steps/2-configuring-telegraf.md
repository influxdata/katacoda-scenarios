# Configuring Telegraf

InfluxDB is just the database. We need to configure Telegraf, our collection agent, for sending metrics and events to the database. Fortunately, there's a Telegraf Docker image too.

## Task

Now we need to configure Telegraf with some plugins. We're going to scrape some essential systems metrics, so we'll configure plugins for:

- cpu
- disk
- diskio
- mem
- net
- system

<pre class="file" data-filename="telegraf.conf" data-target="replace">
[agent]
    interval = "5s"

[[inputs.cpu]]
[[inputs.system]]
[[inputs.mem]]
[[inputs.net]]
[[inputs.disk]]
[[inputs.diskio]]

[[outputs.influxdbv2]]
    urls = ["http://127.0.0.1:9999"]
    token = "backtothefuture"
    organisation = "bigcorp"
    bucket = "default"
</pre>

The following Docker command will run a Telegraf container. As we want to fetch metrics from the host / kernel, we'll need to run this container as privileged.

```
docker run -d \
    --network "influxdb" \
    --privileged \
    -v $(pwd)/telegraf.conf:/etc/telegraf/telegraf.conf \
    telegraf:1.10
```{{execute}}
