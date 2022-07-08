# jobListener
Listens for arrival and end of SLURM Jobs on a computer cluster.
When a job arrives, or finish it sends a push notification using pushover.

## Instalation
move jobListener.sh and push.sh to ~
`git clone github.com/maxcykiert/jobListener
cp -i jobListener.sh push.sh ~/bin/
`

The token and userID in push.sh need to be added.

## Usage
The best way to run the script is to run it in a screen session, so that the status can be accessed.
Alternatively, you can nohup the process:
`nohup sh your-script.sh >> ~/jobListenerLog.out &`
