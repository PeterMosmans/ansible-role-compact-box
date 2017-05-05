Ansible Role: compact-box
=====================

Build status for this role: [![Build Status](https://travis-ci.org/PeterMosmans/ansible-role-compact-box.svg)](https://travis-ci.org/PeterMosmans/ansible-role-compact-box)


This role compacts Linux distributions, preparing them for e.g. Vagrant usage.
It keeps only the specified locale(s), and removes unnecessary packages. Both can be specified in the `defaults/main.yml` file.

By default, all locales will be removed except for `en_US`, and no packages will be removed.

Requirements
------------

None.

Role Variables
--------------

Available variables are listed below, along with default values.


**keep_locales**: A list with locales to keep. The defaults can be found in ```defaults/main.yml```.
Example:
```
keep_locales:
  - en_GB
  - en_US
  - i18n
  - iso14651_t1
  - iso14651_t1_common
```


**unnecessary_packages**: A list with packages which will be removed. The defaults can be found in ```defaults/main.yml```.
Example:
```
unnecessary_packages:
  - build-essential
  - bzip2
  - dkms
  - dpkg-dev
  - gcc
  - make
  - task-laptop
```

After the role has executed succesfully, a script has been copied to the machine, under `/usr/bin/compact_box.sh`. This script will take care of the last compacting steps, before e.g. turning the machine into a Vagrant box. Note that the script will shutdown the box if you run it manually.


Dependencies
------------

None.



Example Playbook
----------------
```
- hosts: all
  become: yes
  become_method: sudo
  roles:
    - role: PeterMosmans.compact-box
```
This example will compact a distribution


License
-------

GPLv3


Author Information
------------------

Created by Peter Mosmans.
