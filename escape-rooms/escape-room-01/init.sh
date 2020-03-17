cd /tmp
curl https://dl.influxdata.com/telegraf/releases/telegraf-1.13.4-static_linux_amd64.tar.gz -o telegraf.tar.gz
tar zxvf telegraf.tar.gz
mv ./telegraf/telegraf /usr/bin/telegraf
chmod +x /usr/bin/telegraf

while :;
do
    dd if=/dev/zero bs=4k iflag=fullblock,count_bytes count=8M >> /var/log/kernel.log2;
    if [[ $? == 1 ]];
    then
        wall "System failure. Shutting down."
        logout
    fi

    sleep 1;
done
