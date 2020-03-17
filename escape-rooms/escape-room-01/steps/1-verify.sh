(( $(docker container ls -a | grep influxdb 2>/dev/null | wc -l) >= 1 )) && echo \"done\"
