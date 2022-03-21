<div align="center">

# Kashall's Home Kubernetes Cluster
🖳 In-house super jank kubernetes cluster built with k3s and managed by flux (gitops) and misc scripts.

**Join the [k8s@home](https://github.com/k8s-at-home) community!**

</div>
<div align="center">

![Discord](https://img.shields.io/discord/324051061033926666?label=Discord&logo=discord&logoColor=white&style=for-the-badge)
![Lines of code](https://img.shields.io/tokei/lines/github/kashalls/home-cluster?color=brightgreen&logo=codefactor&logoColor=white&style=for-the-badge)

</div>
<div align="center">

![Cluster Router](https://img.shields.io/uptimerobot/status/m789236355-59b4869737bfca044ffce63f?label=Home%20Internet&logo=Ubiquiti&logoColor=white&style=flat-square)
![Cluster Networking](https://img.shields.io/uptimerobot/status/m789234791-6b5cfe5b7fa8676903c74062?label=Cluster&logo=googlecloud&logoColor=white&style=flat-square)
![Home Assistant](https://img.shields.io/uptimerobot/status/m789234975-ac1f1c01ba210902f51100da?label=Home%20Assistant&logo=homeassistant&logoColor=white&style=flat-square)

</div>

---

## Overview

This is a mono repository for my home kubernetes cluster. If you want to look at some of the scripts I run on my [Unifi Dream Machine Pro](https://store.ui.com/collections/unifi-network-unifi-os-consoles/products/udm-pro), go check out my [udmp-utils](https://github.com/Kashalls/udmp-utils) repository. Although I have a mind of my own, I tend to follow practices set by the [k8s-at-home](https://github.com/topics/k8s-at-home) community.

---

## ⛵ Kubernetes

There's an excellent template over at [k8s-at-home/template-cluster-k3](https://github.com/k8s-at-home/template-cluster-k3s) if you wanted to try and follow along with some of the practices I use here.

---

### Installation

My cluster is [k3s](https://k3s.io/) provisioned overtop bare-metal Ubuntu 20.04 using the [Ansible](https://www.ansible.com/) galaxy role [ansible-role-k3s](https://github.com/PyratLabs/ansible-role-k3s). This is a semi hyper-converged cluster, workloads and block storage are sharing the same available resources on my nodes while I have a separate server for (NFS) file storage.

🔸 _[Click here](./ansible/) to see my Ansible playbooks and roles._

### Core Components

- [projectcalico/calico](https://github.com/projectcalico/calico): Internal Kubernetes networking plugin.
- [longhorn/longhorn](https://longhorn.io/): Cloud-Native distributed storage built on and for Kubernetes.
- [mozilla/sops](https://toolkit.fluxcd.io/guides/mozilla-sops/): Manages secrets for Kubernetes, Ansible and Terraform.
- [kubernetes-sigs/external-dns](https://github.com/kubernetes-sigs/external-dns): Automatically manages DNS records from my cluster in a cloud DNS provider.
- [jetstack/cert-manager](https://cert-manager.io/docs/): Creates SSL certificates for services in my Kubernetes cluster.
- [traefik/traefik](https://traefik.io/): The Cloud Native Application Proxy

### GitOps

[Flux](https://github.com/fluxcd/flux2) watches my [cluster](./cluster/) folder (see Directories below) and makes the changes to my cluster based on the YAML manifests.

[Renovate](https://github.com/renovatebot/renovate) watches my **entire** repository looking for dependency updates, when they are found a PR is automatically created. When some PRs are merged [Flux](https://github.com/fluxcd/flux2) applies the changes to my cluster.

### Directories

The Git repository contains the following directories under [cluster](./cluster/) and are ordered below by how [Flux](https://github.com/fluxcd/flux2) will apply them.

- **base**: directory is the entrypoint to [Flux](https://github.com/fluxcd/flux2).
- **crds**: directory contains custom resource definitions (CRDs) that need to exist globally in your cluster before anything else exists.
- **core**: directory (depends on **crds**) are important infrastructure applications (grouped by namespace) that should never be pruned by [Flux](https://github.com/fluxcd/flux2).
- **apps**: directory (depends on **core**) is where your common applications (grouped by namespace) could be placed, [Flux](https://github.com/fluxcd/flux2) will prune resources here if they are not tracked by Git anymore.

### Networking

| Name                                         | CIDR              |
|----------------------------------------------|-------------------|
| Kubernetes Nodes                             | `10.20.30.0/24` |
| Kubernetes External Services (Calico w/ BGP) | `10.0.69.0/24` |
| Kubernetes Pods                              | `10.69.0.0/16`    |
| Kubernetes Services                          | `10.96.0.0/16`    |

- HAProxy configured with [udmp-utils](https://github.com/Kashalls/udmp-utils) for the Kubernetes Control Plane Load Balancer.
- Calico configured with `externalIPs` to expose Kubernetes services with their own IP over BGP which is configured on my router.

---

## 🌐 DNS

### Ingress Controller

Over WAN, I have port forwarded ports `80` and `443` to the load balancer IP of my ingress controller that's running in my Kubernetes cluster.

[Cloudflare](https://www.cloudflare.com/) works as a proxy to hide my homes WAN IP and also as a firewall. When not on my home network, all the traffic coming into my ingress controller on port `80` and `443` comes from Cloudflare. In `Unifi` I block all IPs not originating from the [Cloudflares list of IP ranges](https://www.cloudflare.com/ips/).

🔸 _Cloudflare is also configured to GeoIP block all countries except a few I have whitelisted_

# Internal DNS

[CoreDNS](https://github.com/coredns/coredns) is deployed on `Unifi-OS` with the [k8s_gateway](https://github.com/ori-edge/k8s_gateway) external plugin. With this setup, `CoreDNS` has direct access to my clusters ingress records and serves DNS for them in my internal network. `CoreDNS` is only listening on `127.0.0.1` on port `53`.

For adblocking, I have [PiHole](https://pi-hole.net/) also deployed on `Unifi-OS` which has a upstream server pointing the `CoreDNS` I mentioned above. `PiHole` listens on my `MANAGEMENT`, `SERVER`, `IOT` and `GUEST` networks on port `53`. In my firewall rules I have NAT port redirection forcing the `NORMAL`, `IOT` and `GUEST` networks to use the `PiHole` DNS server.

Without much engineering of DNS @home, these options have made my `Unifi-OS` router a single point of failure for DNS. I believe this is ok though because my router _should_ have the most uptime of all my systems.

🔸 _The `k8s-at-home` team maintains a docker container of `CoreDNS` over at [k8s-at-home/container-images](https://github.com/k8s-at-home/container-images/pkgs/container/coredns) that includes the `k8s_gateway` plugin._

### External DNS

[external-dns](https://github.com/kubernetes-sigs/external-dns) is deployed in my cluster and configure to sync DNS records to [Cloudflare](https://www.cloudflare.com/). The only ingresses `external-dns` looks at to gather DNS records to put in `Cloudflare` are ones that I explicitly set an annotation of `external-dns/is-public: "true"`

### Dynamic DNS

My home IP can change at any given time and in order to keep my WAN IP address up to date on Cloudflare I have deployed a [CronJob](./cluster/apps/networking/cloudflare-ddns) in my cluster. This periodically checks and updates the `A` record `ipv4.domain.tld`.

---

## ⚡ Network Attached Storage

:construction: Work in Progress :construction:

---

## 🔧 Hardware


| Device                    | Count | OS Disk Size | Data Disk Size       | Ram  | Operating System | Purpose                        |
|---------------------------|-------|--------------|----------------------|------|------------------|--------------------------------|
| X470D4U                   | 1     | 120GB SSD    | 2x 1TB NVMe          | 64GB | Proxmox 7.1-10   | Kubernetes Master/Worker 1     |
| Dell Optiplex 790         | 1     | 120GB SSD    | N/A                  | 8GB  | Ubuntu 20.04     | Kubernetes Worker 2 (Tajiro)   |
| Dell Optiplex 790         | 1     | 256GB SSD    | N/A                  | 8GB  | Ubuntu 20.04     | Kubernetes Worker 3 (Zenitsu)  |
| Unifi Dream Machine Pro   | 1     | 15GB         | N/A                  | 4GB  | ?                | Dumb ass router                |
| Synology DS412+           | 1     | 2TB SSD      | 4x2TB BTRFS          | 4GB  | ?                | Apps (Minio & etc) & NFS       |
| Dell R710                 | 1     | 2x256 HDD    | 6x1TB ZFS RAIDz2     | 72GB | Proxmox 7.1-10   | Production KVM                 |
| Misc Raspberry Pi         | 2     | 32GB SD Card | N/A                  | 4GB  | Raspian          | NUT Server, SMS Pi, Etc...     |

### Required Addons

I wrote a couple addons for this to work. These addons requires physical devices for them to work.

- [AirGradient Prometheus Server](https://github.com/Kashalls/airgradient-prometheus-sensor)

## Inspiration

Thanks to all the people who donate their time to the [Kubernetes @Home](https://github.com/k8s-at-home/) community.

Special thanks to: [ᗪєνιη ᗷυнʟ](https://github.com/onedr0p/home-cluster), [Bᴇʀɴᴅ Sᴄʜᴏʀɢᴇʀs](https://github.com/bjw-s/k8s-gitops), and [Toboshii Nakama](https://github.com/toboshii/home-cluster) for their assistance.

---

## 🔏 License

See [LICENSE](./LICENSE)