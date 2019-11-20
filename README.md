# SSH_login_notification_in_flock
Get SSH Login activities from User on your machine and send the notification in Flock Channel

## Create Webhook URL in Flock
Before you move to set up SSH login notification on your machine, firstly you need to create an incoming webhook in Flock. You can visit Flock Documentation [here](https://docs.flock.com/display/flockos/Create+An+Incoming+Webhook) and follow step by step how to create it.

## Setup Notification on Server
* SSH to Server which you want to setup this notification
* Download ssh_flock_notification.sh file from this repository
* Open /etc/pam.d/sshd file using your favorite text editor and add this command line at the end of the line:
  ```
  # SSH Login notification on Flock
  session [default=ignore] pam_exec.so /bin/bash /path/directory/you/put/ssh_flock_alert.sh
  ```
* Save the configuration and quit from your text editor
* Restart sshd daemon:
  ```
  sudo service sshd restart
  ```
* Try to logout and re-login on your server. If the code work, you will get the notification on Flock channel
  ![Flock_Notification](./images.png)
