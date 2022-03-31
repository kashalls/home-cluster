# Ansible UDMP Role

Customize your Ubiquiti UDM (Pro) with ansible and [udm-utilities](https://github.com/boostchicken/udm-utilities).

Because the Ubiquiti UDM and Pro have not valid python installation, raw commands must be used to do all the changes.

## Sample Playbook

With this playbook:
* your custom SSL certificate is loaded to the UDM (Pro)
* [udm-utilities](https://github.com/boostchicken/udm-utilities) gets installed
* ssh keys are loaded from the Unifi Controller to the UDM (Pro)
* node exporter for prometheus scraping gets setup as container via podman

```yaml
---
- name: udmp setup
  hosts: unifi-udmp-gateway
  gather_facts: false
  roles:
    - role: mabunixda.ansible_udmp
      certificate: <path-to-certificate.pem>
      certificate_key: <path-to-certificate-key.pem>
```

## UDM Kernel Tools

On default the [UDM Kernel tools](https://github.com/fabianishere/udm-kernel-tools) get not installed. When you enable the variable ```install_kernel_tools``` the tools and the latest kernel get installed. On default also the auto boot into the custom kernel is enabled. This can be switched off by ```udm_kernel_tools_autoboot```.

At the moment it is not supported to install an older kernel. If you have already installed an older kernel, you can switch to this kernel again by setting ```udm_kernel_tools_kernel_version``` manually to a version that is available. The role verifies that this actual version exists before applying the change and booting into this previous kernel.

Please read more about the kernel switch at [UDM Kernel tools](https://github.com/fabianishere/udm-kernel-tools) before giving it a try!

```yaml
---
- name: udmp setup
  hosts: unifi-udmp-gateway
  gather_facts: false
  roles:
    - role: mabunixda.ansible_udmp
      install_kernel_tools: true
```

## You can configure following services:

Except the nodeexporter all services require configuration tasks after deploying the services. This configuration tasks must be done manually or by other roles/plays.

### nodeexporter_enabled

Starts a nodeexporter instance via podman on the gateway to scrape metrics via prometheus

### frr_enabled

FRR is a service to enable BGP routing ( e.g. when running kubernetes with Metallb, or nomad with calico )

### rsyncd_enabled

This services enabled you to offload your configuration/backup by rsync via port 2202

### openvpn_enabled

Openvpn Service to connect the UDM(Pro) to a certain OpenVPN tunnel.

### zerotier_enabled

Launches a zerotier container on the UDM(Pro) and connects to a certain zerotier network