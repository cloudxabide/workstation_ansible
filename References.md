# References


## Purpose
Document the structure and setup for my Ansible code


### Create Ansible Directories
[Ansible Best Practices](https://docs.ansible.com/ansible/2.8/user_guide/playbooks_best_practices.html#content-organization)

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

```

