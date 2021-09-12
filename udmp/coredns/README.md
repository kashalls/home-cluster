# Run coredns on your UDM

## Requirements

1. This requires that you follow boostchicken's guide to setting up the boot script described [here](https://github.com/boostchicken/udm-utilities/tree/master/on-boot-script)

## Customization

* Feel free to change [53-coredns.conflist](./53-coredns.conflist) to change the IP and MAC address of the container.
* Update [53-coredns.sh](./53-coredns.sh) with your own values.

## Steps

1. Copy [05-install-cni-plugins.sh](../cni-plugins/05-install-cni-plugins.sh) to /mnt/data/on_boot.d
1. Execute /mnt/data/on_boot.d/05-install-cni-plugins.sh
1. On your controller, make a Corporate network with no DHCP server and give it a VLAN. For this example we are using VLAN 5.
1. Copy [53-coredns.conflist](./53-coredns.conflist) to /mnt/data/podman/cni.  This will create your podman macvlan network
1. Copy [53-coredns.sh](./53-coredns.sh) to /mnt/data/on_boot.d and update its values to reflect your environment

```yaml
   ...
   VLAN=5
   IPV4_IP="10.0.5.3"
   IPV4_GW="10.0.5.1/24"
   ...
   CONTAINER=coredns
   ...
   ```

1. Execute /mnt/data/on_boot.d/53-coredns.sh
1. Create directories for persistent coredns configuration

```bash
   mkdir -p /mnt/data/coredns
```

1. Copy [Corefile](./Corefile) to /mnt/data/coredns and update your domain used with your cluster.
1. Generate and add a kubeconfig to /mnt/data/coredns/kubeconfig so your k8s_gateway will work.
1. Create and run the coredns docker container. The following command creates a container using our coredns library.

```sh
podman run -d --network coredns --restart always \
  --name coredns \
  --hostname core.dns \
  -v "/mnt/data/coredns/:/config/" \
  k8s-at-home/coredns:latest
```

1. Update your DNS Servers to 10.0.5.3 (or your custom ip) for each of your Networks (UDM GUI | Networks | Advanced | DHCP Name Server)

## Upgrading your coredns container

1. Edit update-coredns.sh script to use the same `podman run` command you used at installation.
2. Copy the update-coredns.sh script to /mnt/data/scripts
3. Anytime you want to update your coredns installation, simply run `/mnt/data/scripts/update-coredns.sh`
