ansible-role-grafana-kiosk
=========

Installs [grafana-kiosk](https://github.com/grafana/grafana-kiosk) on a Raspberry Pi.

Requirements
------------

Requires a ssh-enabled Raspberry Pi.

Role Variables
--------------

| variable | description | default | 
| --- | --- | --- |
| grafana_kiosk_user| grafana-kiosk will be installed and launched from this user's `home`. You might have to create the user first. | pi |
| grafana_kiosk_config_yaml| You can configure grafana kiosk by providing your own [config.yaml](https://github.com/grafana/grafana-kiosk#using-a-configuration-file). The [default config](files/grafana-kiosk-config.yaml) loads a public dashboard from [play.grafana.org](https://play.grafana.org). | grafana-kiosk-config.yaml (relative to role) |

Example Playbook
----------------

Here's the [playbook I use at home](https://github.com/sladkoff/ansible-playbook-grafana-kiosk) :house:

License
-------

MIT

Author Information
------------------

[sladkoff](https://github.com/sladkoff)