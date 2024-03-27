# Ansible_ToolBox

## What is Ansible:
**Ansible** is a powerful open-source SCM tool that simplifies automation, configuration management, and application deployment. It is designed to make complex tasks easy to manage on immutable stracture.

## SCM
**Software Configuration Management** (SCM) tools are essential for managing and controlling software development processes. They help track changes, versions, and configurations in a systematic and organized manner, ensuring that software remains stable, reliable, and easy to maintain.


### Install Ansible

**Step  1 :** create venv and active venv

    python -m venv venv 
    source venv/bin/activate

**Step 2 :** Install and Upgrade pip

    pip install -U pip 

**Step 3 :** Install wheel and ansible

    pip install wheel
    pip install ansible 

**Step 4 :** Install wheel and ansible 

    pip install wheel
    pip install ansible

**Step 5 :** Create requirements.txt  

    pip freez > requirements.txt 

## Inventory
**inventory.ini** file serves as an inventory source. It’s a configuration file that defines the hosts and groups of hosts that Ansible can manage

**Step 6 :** Create inventory file: in terminal type : touch **inventory.ini** and set host information into file 

    [all]
    mynode ansible_host=host_address ansible_user=host_username

**Step 7 :** Test Host : We use the fine hand to test the connection with the hosts

    ansible all -i inventory.ini -m ping 

**NOTE** : Python must be installed the host and we will use the following command to test its installition:

    ansible all -i inventory.ini -m python

**Step 8 :** Run playbook : Now  we have to write we want done in the from of a playbook (**play.yaml**) file and run that file on the desiredhost that we put in **inventory.ini** 

    ansible-playbook -i inventory.ini play.yaml

### Playbook Example
**The following table contains a series of different playbook in different situatin**

|Item|Details|
|--|--|
|‌‌ [1](https://github.com/majidroodi/DevOps_ToolBox/tree/main/Ansible/1) | playbook for install package |
| [2](https://github.com/majidroodi/DevOps_ToolBox/tree/main/Ansible/2) | playbook for install package with variables |
| [3](https://github.com/majidroodi/DevOps_ToolBox/tree/main/Ansible/3) | playbook for check distro and install package on desired distro |
| [4](https://github.com/majidroodi/DevOps_ToolBox/tree/main/Ansible/4) | crate ansible_vault and run playbook with check secret file on vault |
| [5](https://github.com/majidroodi/DevOps_ToolBox/tree/main/Ansible/5) | playbook for get config and copy to desird host with jinja2 file |
| 