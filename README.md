# NoOneSurvives_infra
NoOneSurvives Infra repository

> **ProTip:** use [stackedit](https://stackedit.io/) for help

## bastion/someinternalhost IP addresses
bastion_IP = 35.205.97.230
someinternalhost_IP = 10.132.0.4

## SSH to someinternalhost
**One line command**
> **HALP link:** [ssh/passingthrough/Proxycommand](https://www.cyberciti.biz/faq/linux-unix-ssh-proxycommand-passing-through-one-host-gateway-server/)

- ssh -tt -i .ssh/appuser -A appuser@35.205.97.230 ssh -tt 10.132.0.4
> **Windows note:** For run ssh-agent in git bash: exec ssh-agent bash. And then u can add key for ssh-add.
> -tt uses for force tty allocation 

***ssh config for alias*** : ''ssh someinternalhost''
- ``~/.ssh/config:``

```
Host someinternalhost
HostName someinternalhost
User appuser
ProxyCommand ssh -i ~/.ssh/appuser -A appuser@35.205.97.230 nc %h %p
```
