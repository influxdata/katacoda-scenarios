We have provided a `telegraf.conf` for you, which is available on the file browser on the right hand side.

This has been preconfigured with the output plugin that allows it to store time series data in the InfluxDB we configured in the previous step.

We would strongly encourage you not to remove that plugin.

You can run Telegraf with the following command.

```
telegraf --config /root/telegraf.conf
```{{execute}}

Whenever you change the `telegraf.conf` file, please press `Control-c` and then rerun Telegraf.

## Next Steps

Telegraf is only configured with the "internal" plugin. You'll need to:

1. Add more plugins to understand the health of the system
2. After you've pinpointed the problem, you'll want to identify the root cause
3. Fix the root cause

You can find a list of plugins [here](https://v2.docs.influxdata.com/v2.0/reference/telegraf-plugins/). Each plugin has a "View" button which takes you to its documentation on GitHub. Inside of the docs you'll see how to configure the plugin and some example output; which reveals the data the plugin makes available to you.

### Note

Please **do not** stop Telegraf unless you're restarting it, or have identified the root cause and are ready to apply your fix.

Introspecting the system through the CLI is discouraged, you have everything you need with Telegraf and InfluxDB to solve this problem.

Click "Continue" when you've deployed your fix.
