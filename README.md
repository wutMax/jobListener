# jobListener
Listens for arrival and end of SLURM Jobs on a computer cluster.
When a job arrives, or finish it sends a push notification using pushover.

## Instalation
move jobListener.sh and push.sh to ~/bin/   
```
    git clone https://github.com/wutMax/jobListener  
    cp -i jobListener.sh push.sh ~/bin/   
```

The token and userID in push.sh need to be added.

## Usage
The script will run for ~ 1 week, but the timer will resets if it receives a job.
The best way to run the script is to run it in a GNU screen session, so that the status can be accessed.
Alternatively, you can nohup the process:  
`nohup bash jobListener.sh >> ~/jobListenerLog.out &`
