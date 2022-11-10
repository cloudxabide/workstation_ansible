# References


## Purpose
Document the structure and setup for my Ansible code

I am definitely still learning (and unlearning, I guess) the best practices for deploying code that is:

* easy to read/understand
* reusable
* follows some sort of widely accepted methodology

## Create Ansible Directories
```
make_ansible_dirs() {
DIRS=" 
Examples
production
staging
group_vars
library
roles
roles/common
roles/common/defaults
roles/common/files
roles/common/meta
roles/common/tasks 
roles/common/templates
roles/common/vars
"

for DIR in $DIRS
do 
  echo "$DIR"
  mkdir -p "$DIR"
done
}

THIRD_PARTY_APPS="Google_Chrome Spotify_Client Slack_Client"
cd roles
for APP in $THIRD_PARTY_APPS
do 
  ansible-galaxy roles init $APP 
done
```

## References
[Ansible Best Practices](https://docs.ansible.com/ansible/2.8/user_guide/playbooks_best_practices.html#content-organization)  

[Developing Ansible Roles](https://www.redhat.com/sysadmin/developing-ansible-role)
