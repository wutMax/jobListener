#!/bin/bash

# Requires costumisation#
clusterName=myCluster


source ~/bin/push.sh
echo 'Welcome To JobListener'
a=$(squeue | grep $(whoami) | wc -l)
name_of_job=$(squeue | grep $(whoami) | awk '{print $1 "\t" $2"\t" $3}')
counter=0
# Checks every 30 seconds for 1 week 3 hour if the number of jbs change then send a notification

echo "$(date  +'%d/%m %H:%M') Running $a Jobs."

while [[ $a -gt -1 && counter -lt 20000 ]]; do
counter=$((counter +1))
sleep 30
if [ $a -lt $(squeue | grep $(whoami) | wc -l) ]
then
a=$(squeue | grep $(whoami) | wc -l);
name_of_job=$(squeue | grep $(whoami) | awk '{print $1 "\t" $2"\t" $3}');
push "$clusterName" "Received Job. Running $a jobs "
echo "$(date  +'%d/%m %H:%M')   Received Job. Running $a jobs" 
counter=0       #resets the counter
fi 

if [ $a -gt $(squeue | grep $(whoami) | wc -l) ] 
then 

name_remaining=$(squeue | grep $(whoami) | awk '{print $1 "\t" $2"\t" $3}')
name_of_job_finished=$(printf "$name_of_job\n$name_remaining\n" | sort | uniq -u | awk '{print $3}')
echo "Job finished: $name_of_job_finished"
a=$(squeue | grep $(whoami) | wc -l)
push "$clusterName" "One job has finished ($a remaining). $name_of_job_finished" 
echo "$(date +'%d/%m %H:%M')   One job has finished: $name_of_job_finished. ($a remaining)"
name_of_job=$name_remaining

fi

done
echo 'JobListener is terminating'
