USED_1=$(df | grep vda | awk '{print $3}')
sleep 1
USED_2=$(df | grep vda | awk '{print $3}')

if [[ $USED_1 == $USED_2 ]];
then
    echo "done"
fi