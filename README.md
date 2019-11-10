Podman
======

Install and configure podman. Valid options for storage.conf can be seen [here](https://github.com/containers/storage/blob/master/docs/containers-storage.conf.5.md).

Requirements
------------

None so far.

Role Variables
--------------

| Variable | Type | Default | Description |
| -------- | ---- | ------- | ----------- |
| `podman_storage_conf_file` | String | `/etc/containers/storage.conf` | Path to storage.conf |
| `podman_storage_settings` | Dict | `{}` | Settings for section storage in storage.conf |
| `podman_storage_options_settings` | Dict | `{}` | Settings for section storage.options in storage.conf |
| `podman_storage_options_thinpool_settings` | Dict | `{}` | Settings for section storage.options.thinpool in storage.conf |

Dependencies
------------

None so far...

Example Playbook
----------------

```
---

- hosts: servers
  become_user: root
  vars:
    podman_storage_settings:
      driver: zfs 
  roles:
     - derJD.podman
```
License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
[derJD](https://github.com/derJD/)
