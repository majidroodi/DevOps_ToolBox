## What is Playbook:

**Ansible Playbooks**  offer a repeatable, reusable, simple configuration management and multi-machine deployment system, one that is well suited to deploying complex applications. If you need to execute a task with Ansible more than once, write a playbook and put it under source control.
  

### How to run playbook


**Step  1 :** change name to play.yaml

    mv play_install_package_with_variable.yaml play.yaml 

**Step 2 :** run playbook on inventory

    ansible-playbook -i inventory.ini -b play.yaml  