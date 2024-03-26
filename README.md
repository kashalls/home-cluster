<div align="center">

# Kashall's Home Operations

[![Discord](https://img.shields.io/discord/673534664354430999?style=for-the-badge&label&logo=discord&logoColor=white&color=blue)](https://discord.gg/home-operations)&nbsp;&nbsp;&nbsp;
[![Kubernetes](https://img.shields.io/badge/dynamic/yaml?url=https%3A%2F%2Fraw.githubusercontent.com%2Fkashalls%2Fhome-cluster%2Fmain%2Fkubernetes%2Fapps%2Fmain%2Fsystem-upgrade%2Fsystem-upgrade-controller%2Fplans%2Fkubernetes.yaml&query=%24.spec.version&style=for-the-badge&logo=kubernetes&logoColor=white&label=%20)](https://k3s.io/)&nbsp;&nbsp;&nbsp;
[![Renovate](https://img.shields.io/github/actions/workflow/status/kashalls/home-cluster/renovate.yaml?branch=main&label=&logo=renovatebot&style=for-the-badge&color=blue)](https://github.com/kashalls/home-cluster/actions/workflows/renovate.yaml)

[![Age-Days](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.ok8.sh%2Fquery%3Fmetric%3Dcluster_age_days&style=flat-squaree&label=Age)](https://github.com/kashalls/kromgo/)&nbsp;&nbsp;&nbsp;
[![Uptime-Days](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.ok8.sh%2Fquery%3Fmetric%3Dcluster_uptime_days&style=flat-square&label=Uptime)](https://github.com/kashalls/kromgo/)&nbsp;&nbsp;&nbsp;
[![Active-Alerts](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.ok8.sh%2Fquery%3Fmetric%3Dprometheus_active_alerts&style=flat-square&label=Firing%20Alerts
)](https://github.com/kashalls/kromgo/)&nbsp;&nbsp;&nbsp;
[![Node-Count](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.ok8.sh%2Fquery%3Fmetric%3Dcluster_node_count&style=flat-square&label=Nodes)](https://github.com/kashalls/kromgo/)&nbsp;&nbsp;&nbsp;
[![Pod-Count](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.ok8.sh%2Fquery%3Fmetric%3Dcluster_pods_running&style=flat-square&label=Pods&color=green)](https://github.com/kashalls/kromgo/)&nbsp;&nbsp;&nbsp;
[![CPU-Usage](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.ok8.sh%2Fquery%3Fmetric%3Dcluster_cpu_usage&style=flat-square&label=CPU)](https://github.com/kashalls/kromgo/)&nbsp;&nbsp;&nbsp;
[![Power-Usage](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.ok8.sh%2Fquery%3Fmetric%3Dcluster_power_usage&style=flat-square&label=Power)](https://github.com/kashalls/kromgo/)

</div>

## What is this?

This is the home of the kubernetes cluster I deployed at home. It features a couple of low power consumer machines running [Debian 12](https://www.debian.org/) with [k3s](https://k3s.io/) deployed using my [ansible configuration](/ansible/).

This repo serves as the "roadmap" that is automatically updated and deployed thanks to [renovate](https://www.mend.io/renovate/) and [fluxcd](https://fluxcd.io/).

## How did you do this?

Thanks to [onedr0p](https://github.com/onedr0p), there is the [cluster template](https://github.com/onedr0p/flux-cluster-template) that allows you to easily get started with your own kubernetes cluster at home. You don't need to have multiple computers or a fancy setup to get one working.

If you're interested, you can also join the community [Discord](https://discord.com): [Home Operations](https://discord.gg/home-operations). Several people are involved daily and it makes for some interesting conversations.

### Directories

This Git repository contains the following directories under [Kubernetes](./kubernetes/).

```sh
📁 kubernetes
├── 📁 apps
│   ├── 📁 main
│   └── 📁 storage
├── 📁 bootstrap
└── 📁 config
    ├── 📁 repositories
    └── 📁 vars
```

## ☁️ Cloud Dependencies

While most of my infrastructure and workloads are self-hosted I do rely upon the cloud for certain key parts of my setup. This saves me from having to worry about two things. (1) Dealing with chicken/egg scenarios and (2) services I critically need whether my cluster is online or not.

| Service                                         | Use                                                               | Cost           |
|-------------------------------------------------|-------------------------------------------------------------------|----------------|
| [1Password](https://1password.com/)             | Secrets with [External Secrets](https://external-secrets.io/)     | ~$55/yr        |
| [Cloudflare](https://www.cloudflare.com/)       | Domain and R2                                                     | ~$30/yr        |
| [GCP](https://cloud.google.com/)                | Voice interactions with Home Assistant over Google Assistant      | Free           |
| [GitHub](https://github.com/)                   | Hosting this repository and continuous integration/deployments    | Free           |
| [Let's Encrypt](https://letsencrypt.org/)       | Issuing SSL Certificates                                          | Free           |
| [Migadu](https://migadu.com/)                   | Email hosting                                                     | ~$20/yr        |
| [NextDNS](https://nextdns.io/)                  | My router DNS server which includes AdBlocking                    | ~$20/yr        |
| [Pushover](https://pushover.net/)               | Kubernetes Alerts and application notifications                   | Free           |
| [UptimeRobot](https://uptimerobot.com/)         | Monitoring internet connectivity and external facing applications | ~$60/yr        |
|                                                 |                                                                   | Total: ~$20/mo |
---


## 💻 Networking

<details>
  <summary>Click to see a high-level network diagram</summary>

  <img src="https://raw.githubusercontent.com/kashalls/home-cluster/main/.docs/assets/network-topology.png" align="center" width="600px" alt="networking"/>
</details>

### 📮 Routing

I use [VyOS](https://vyos.io/) as my current routing operating system.
Previous solutions I had used consisted of [OPNSense](https://opnsense.org/), and the [Unifi Dream Machine Pro](https://store.ui.com/us/en/pro/products/udm-pro).

Here's a couple repositories to show my current/past configurations for these solutions.
- [kashalls/vyos-config](https://github.com/kashalls/vyos-config)
- [kashalls/udmp-utils](https://github.com/Kashalls/udmp-utils)

### 🌐 DNS

My current setup consists of [bind9](https://github.com/isc-projects/bind9) and [dnsdist](https://dnsdist.org/) deployed as containers on [VyOS](https://vyos.io/). I currently point all DNS to Cloudflare's 1.1.1.1, and I am planning on intergrating nextdns in the future.

My kubernetes clusters interact with bind9 using the `RFC2136` standard to sync DNS records.

---

## 🔧 Hardware

<details>
  <summary>Click to see the rack!</summary>

  <img src="" align="center" width="200px" alt="rack"/>
</details>

| Device                      | Count | OS Disk Size | Data Disk Size              | Ram  | Operating System | Purpose             |
|-----------------------------|-------|--------------|-----------------------------|------|------------------|---------------------|
| Raspberry Pi 4              | 3     | 256GB SSD    |                             | 8GB  | Debian           | Kubernetes Masters  |
| Lenovo ThinkCentre M900     | 6     | 256GB SSD    | 1TB NVMe (rook-ceph)        | 16GB | Debian           | Kubernetes Workers  |
| Fran the Fabulous Nas       | 1     | 2x1TB SSD    | 5x8TB (raidz2)              | 64GB | Debian           | NFS + Backup Server |
| Raspberry Pi 3              | 1     | 32GB (SD)    | -                           | 4GB  | PiKVM (Arch)     | Network KVM         |
| 1U ??? Box                  | 1     | 256GB SSD    | -                           | 8GB  | Opnsense         | Router              |
| USW 24 G1                   | 1     | -            | -                           | -    | -                | 1Gb Switch          |
| Unifi USP PDU Pro           | 1     | -            | -                           | -    | -                | PDU                 |
| APC Back-Ups 1500           | 1     | -            | -                           | -    | -                | UPS                 |

---

## ⭐ Stargazers

<div align="center">

[![Star History Chart](https://api.star-history.com/svg?repos=kashalls/home-cluster&type=Date)](https://star-history.com/#kashalls/home-cluster&Date)

</div>

---

## Inspiration

Thanks to all the people who donate their time to the [Home Operations](https://discord.gg/home-operations) community.

Special thanks to: [ᗪєνιη ᗷυнʟ](https://github.com/onedr0p/home-cluster), [Bᴇʀɴᴅ Sᴄʜᴏʀɢᴇʀs](https://github.com/bjw-s/k8s-gitops), and [Toboshii Nakama](https://github.com/toboshii/home-cluster) for their assistance.
