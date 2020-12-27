Podman
======

Install and configure podman.
Valid options for storage.conf can be seen [here](https://github.com/containers/storage/blob/master/docs/containers-storage.conf.5.md).
Valid options for registries.conf can be seen [here](https://github.com/containers/image/blob/master/docs/containers-registries.conf.5.md).

Requirements
------------

None so far.

Role Variables
--------------

| Variable | Type | Default | Description |
| -------- | ---- | ------- | ----------- |
| `podman_packages` | List | `["podman"]` | List of packages to install |
| `podman_conf_dir` | String | `/etc/containers/` | Container config directory |
| `podman_storage_conf_file` | String | `/etc/containers/storage.conf` | Path to storage.conf |
| `podman_registries_conf_file` | String | `/etc/containers/registries.conf` | Path to registries.conf |
| `podman_storage_settings` | Dict | `{}` | Settings for storage.conf |
| `podman_registries_settings` | Dict | `{}` | Settings for registries.conf |
| `podman_repo_base_url` | String | [See defaults/main.yml](defaults/main.yml#L13) | libcontainer's repository URL |
| `podman_repo_distro` | String | `{{ ansible_distribution }}_{{ ansible_distribution_version }}` | String containing Distro and version |

Dependencies
------------

None so far...

Example Playbook
----------------

* Most basic example

```yaml
---

- hosts: servers
  become_user: root
  roles:
     - derJD.podman
```

* Use zfs as storage driver and let it use a different dataset

```yaml
---

- hosts: servers
  become_user: root
  vars:
    podman_storage_settings:
      storage:
        driver: zfs
      storage.options.zfs:
        fsname: rpool/podman

  tasks:
    - name: zfs create rpool/podman
      community.general.zfs:
        name: rpool/podman
        state: present
        extra_zfs_properties:
          mountpoint: none

    - include_role: 
         name: derJD.podman
```

* Example with many config switches

```yaml
---

- hosts: servers
  become_user: root
  vars:
    podman_storage_settings:
      storage:
        driver: zfs
      storage.options:
        override_kernel_check: true
      storage.options.thinpool:
        skip_mount_home: false
        fs: ext4
    podman_registries_settings:
      registries.search:
        regestries:
          - docker.io
          - registry.fedoraproject.org
          - quay.io
          - registry.access.redhat.com
          - registry.centos.org
      registries.block:
        registries: []

  roles:
     - derJD.podman
```

License
-------

BSD

Author Information
------------------

[derJD](https://github.com/derJD/)
