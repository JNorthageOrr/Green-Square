#Implementation Instructions:

Fork the Repo

Clone the Forked repo

Change the computer user 'jnorr', referenced in make-square-script.sh to whatever your computer user is

from the cli, run: crontab -e

At the bottom of the file, add the following, again, using your computer user, not 'jnorr':

USER=jnorr

55 16 * * * /bin/bash /home/$USER/Green-Square/make-square-script.sh

This sets the cron job to run:

minute(55) hour(16) day(month -- any) month(* any) week(* any) use bash to execute the make-square-script.sh

#Troubleshooting:

##Initially, while youre testing, you may want to adjust the system time, so it executes at a different time, the date command will show the system time:

$date

##Check the status of the cron job, use sudo, as necessary:

grep CRON /var/log/syslog

##Error:

Jan 28 16:40:01 openvpn-droplet CRON[29352]: (CRON) info (No MTA installed, discarding output)

This means the script was run and theres an error, but your system doesnt have a mailer setup to tell you about the nature of the problem, you can install a mailer if you want and then see the problem, after running the cronjob again (postfix works on ubuntu, may need something else for mac): sudo apt-get install postfix

Recommend selecting the 'local only' option during setup

##Check what error is happening using postfix:

sudo tail -f /var/mail/jnorr

ver 1.0.6000000000000000000000000000000
