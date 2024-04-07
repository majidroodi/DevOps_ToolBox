## What is Playbook:

**Ansible Playbooks**  offer a repeatable, reusable, simple configuration management and multi-machine deployment system, one that is well suited to deploying complex applications. If you need to execute a task with Ansible more than once, write a playbook and put it under source control.
  
**Ansible Vault** is a feature that allows users to encrypt values and data structures within Ansible projects. This provides the ability to secure any sensitive data that is necessary to successfully run Ansible plays but should not be publicly visible, like passwords or private keys. Ansible automatically decrypts vault-encrypted content at runtime when the key is provided.

### How to create vault

    ansible-vault create vault.yml
**Set Password for Voualt**

### How to run playbook


**Step  1 :** change name to play.yaml

    mv play_getConfig_and_copy_to_host.yaml play.yaml 

**Step 2 :** run playbook on inventory

    ansible-playbook -i inventory.ini -b --ask-become-pass --ask-vault-pass play_with_secret_file.yaml

 