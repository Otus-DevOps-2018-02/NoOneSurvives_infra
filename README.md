# NoOneSurvives_infra
NoOneSurvives Infra repository (first homeworks)

> **ProTip:** use [stackedit](https://stackedit.io/) for help </br>
> **WindowsTip:** use '^' instead '\\' in CMD </br>
> **gcutilsTip:** gsutil cp filename gs://bucket  - work with yours buckets

> **HALP Instruments:** </br>
> - [ATOM](https://atom.io/)
> - [Markdown-plugin](https://github.com/zhuochun/md-writer)

# Homework-04
## bastion/someinternalhost IP addresses
bastion_IP = 35.205.97.230
someinternalhost_IP = 10.132.0.4

## SSH to someinternalhost
**One line command**
> **HALP link:** [ssh/passingthrough/Proxycommand](https://www.cyberciti.biz/faq/linux-unix-ssh-proxycommand-passing-through-one-host-gateway-server/) </br>

- ssh -tt -i .ssh/appuser -A appuser@35.205.97.230 ssh -tt 10.132.0.4
> **Windows note:** For run ssh-agent in git bash: exec ssh-agent bash. And then u can add key for ssh-add. </br>
> -tt uses for force tty allocation

***ssh config for alias*** : ''ssh someinternalhost''
- ``~/.ssh/config:``

```
Host someinternalhost
HostName someinternalhost
User appuser
ProxyCommand ssh -i ~/.ssh/appuser -A appuser@35.205.97.230 nc %h %p
```

# Homework-05
## reddit-app IP address and port
testapp_IP = 104.155.28.51
testapp_port = 9292

## SCRIPTS
> **GitTips:**
- git update-index --chmod=+x foo.sh  - make file as executable
- git ls-files --stage  - check file modes

-  Use startup script for instance: </br>
```gcloud compute instances create reddit-app-test --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --scopes storage-ro --metadata startup-script-url=gs://bucket-kesh/homework-05/startup-script.sh```

> If u can't use URL of yours (share) buckets add this **option** to yours gcloud command: </br>
> ```
> --metadata startup-script= #! /bin/bash
> #Install mongodb-org
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo bash -c 'echo deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse > /etc/apt/sources.list.d/mongodb-org-3.2.list'
sudo apt update
sudo apt install mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
sudo systemctl status mongod
echo "Mongodb installation complete"
>#Install ruby + bundler
sleep 3
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential
ruby -v && bundler -v
echo "Ruby and bundler installation complete"
>#Deploy app
sleep 3
cd /home/appuser && git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d
ps aux | grep puma
echo "Check yours app in http://url:port"
curl -I 127.0.0.1:9292
 ```


 ## Firewall rules

 * Add rule to your project:</br>
 ```gcloud compute firewall-rules create default-puma-server --allow tcp:9292 --target-tags=puma-server```
