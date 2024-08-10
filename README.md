<div align="center">

# Kashall's Home Operations

[![Discord](https://img.shields.io/discord/673534664354430999?style=for-the-badge&label&logo=discord&logoColor=white&color=blue)](https://discord.gg/home-operations)&nbsp;&nbsp;
[![Talos](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.ok8.sh%2Fquery%3Fformat%3Dendpoint%26metric%3Dtalos_version&style=for-the-badge&logo=talos&logoColor=white&color=blue&label=%20)](https://www.talos.dev/)&nbsp;&nbsp;
[![Kubernetes](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.ok8.sh%2Fquery%3Fformat%3Dendpoint%26metric%3Dkubernetes_version&style=for-the-badge&logo=kubernetes&logoColor=white&color=blue&label=%20)](https://www.talos.dev/)&nbsp;&nbsp;
[![Renovate](https://img.shields.io/github/actions/workflow/status/kashalls/home-cluster/renovate.yaml?branch=main&label=&logo=renovatebot&style=for-the-badge&color=blue)](https://github.com/kashalls/home-cluster/actions/workflows/renovate.yaml)

[![Main-Cluster](https://img.shields.io/endpoint?url=https%3A%2F%2Fhearthook.kashall.workers.dev%2Fmain&style=for-the-badge&logo=prometheus&logoColor=white)](https://github.com/kashalls/hearthook)&nbsp;&nbsp;
[![Storage-Cluster](https://img.shields.io/endpoint?url=https%3A%2F%2Fhearthook.kashall.workers.dev%2Fstorage&style=for-the-badge&logo=prometheus&logoColor=white)](https://github.com/kashalls/hearthook)&nbsp;&nbsp;

[![Age-Days](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.ok8.sh%2Fquery%3Fmetric%3Dcluster_age_days&style=flat-squaree&label=Age)](https://github.com/kashalls/kromgo/)&nbsp;&nbsp;&nbsp;
[![Uptime-Days](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.ok8.sh%2Fquery%3Fmetric%3Dcluster_uptime_days&style=flat-square&label=Uptime)](https://github.com/kashalls/kromgo/)&nbsp;&nbsp;&nbsp;
[![Active-Alerts](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.ok8.sh%2Fquery%3Fmetric%3Dprometheus_active_alerts&style=flat-square&label=Firing%20Alerts)](https://github.com/kashalls/kromgo/)&nbsp;&nbsp;&nbsp;
[![Node-Count](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.ok8.sh%2Fquery%3Fmetric%3Dcluster_node_count&style=flat-square&label=Nodes)](https://github.com/kashalls/kromgo/)&nbsp;&nbsp;&nbsp;
[![Pod-Count](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.ok8.sh%2Fquery%3Fmetric%3Dcluster_pods_running&style=flat-square&label=Pods&color=green)](https://github.com/kashalls/kromgo/)&nbsp;&nbsp;&nbsp;
[![CPU-Usage](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.ok8.sh%2Fquery%3Fmetric%3Dcluster_cpu_usage&style=flat-square&label=CPU)](https://github.com/kashalls/kromgo/)&nbsp;&nbsp;&nbsp;
[![Power-Usage](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.ok8.sh%2Fquery%3Fmetric%3Dcluster_power_usage&style=flat-square&label=Power)](https://github.com/kashalls/kromgo/)

</div>

## What is this?

This is the home of the kubernetes cluster I deployed at home. It features a couple of low power lenovo computers running [Talos](https://www.talos.dev/) which allows seamless bootstraping when combined with my [vyos-config/matchbox](https://github.com/kashalls/vyos-config/blob/main/config-parts/container.sh#L98) config. My NAS is running [Debian 12](https://www.debian.org/) with [k3s](https://k3s.io/) deployed using my [ansible configuration](/ansible/).

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

| Service                                    | Use                                                            | Cost           |
|--------------------------------------------|----------------------------------------------------------------|----------------|
| [1Password](https://1password.com/)        | Secrets with [External Secrets](https://external-secrets.io/)  | ~$55/yr        |
| [Cloudflare](https://www.cloudflare.com/)  | Domain and R2                                                  | ~$30/yr        |
| [GCP](https://cloud.google.com/)           | Voice interactions with Home Assistant over Google Assistant   | Free           |
| [GitHub](https://github.com/)              | Hosting this repository and continuous integration/deployments | Free           |
| [Let's Encrypt](https://letsencrypt.org/)  | Issuing SSL Certificates                                       | Free           |
| [Migadu](https://migadu.com/)              | Email Hosting                                                  | ~$20/yr        |
| [Pulumi Cloud](https://app.pulumi.com/)    | Resource state management                                      | Free           |
| [Pushover](https://pushover.net/)          | Kubernetes Alerts and application notifications                | Free           |
| [UniFi Site Manager](https://unifi.ui.com) | UniFi External Access Management                               | Free           |
|                                            |                                                                | Total: ~$10/mo |
---


## 💻 Networking

<details>
  <summary>Click to see a high-level network diagram</summary>

  <img src="https://raw.githubusercontent.com/kashalls/home-cluster/main/.github/assets/network-topology.png" align="center" width="600px" alt="networking"/>
</details>


### 🌐 DNS

UniFi released a new feature update with UniFi routers that allow you to create custom dns records to be served to the whole network. I wrote[External DNS Unifi Webhook](https://github.com/kashalls/external-dns-unifi-webhook) to allow [External DNS](https://github.com/kubernetes-sigs/external-dns/) to gather service and ingress hosts from my clusters and deploy the records without any extra local resolvers.

---

## 🔧 Hardware

<details>
  <summary>Click to see the rack!</summary>
  Updated 05/25/2024

  <img src="https://owo.whats-th.is/2drDDRN.jpg" align="center" width="200px" alt="rack"/>
</details>

| Device                  | Count | OS Disk Size | Data Disk Size       | Ram  | Operating System | Purpose           |
|-------------------------|-------|--------------|----------------------|------|------------------|-------------------|
| UXG-Max                 | 1     | -            | -                    | -    | UniFi OS         | Router            |
| UCK-G2-Plus             | 1     | -            | 250 GB HDD           | 3GB  | UniFi OS         | UniFi Management  |
| US-24-G1                | 1     | -            | -                    | -    | -                | Core Switch       |
| U6-LR                   | 1     | -            | -                    | -    | -                | Office AP         |
| UAP-AC-Pro              | 1     | -            | -                    | -    | -                | Dining Room AP    |
| USP-PDU-Pro             | 1     | -            | -                    | -    | -                | Rack PDU          |
| Raspberry Pi 4          | 3     | 256GB SSD    | -                    | 8GB  | Talos            | Raspberry Cluster |
| Lenovo ThinkCentre M900 | 6     | 256GB SSD    | 1TB NVMe (rook-ceph) | 16GB | Talos            | Kubernetes Nodes  |
| Fran the Fabulous Nas   | 1     | 2x1TB SSD    | 5x8TB (raidz2)       | 64GB | Debian           | Storage Cluster   |
| Raspberry Pi 3          | 1     | 32GB (SD)    | -                    | 4GB  | -                | Network KVM       |
| APC Back-Ups 1500       | 1     | -            | -                    | -    | -                | UPS               |

---

## ⭐ Stargazers

<div align="center">

[![Star History Chart](https://api.star-history.com/svg?repos=kashalls/home-cluster&type=Date)](https://star-history.com/#kashalls/home-cluster&Date)

</div>

---

## Inspiration

Thanks to all the people who donate their time to the [Home Operations](https://discord.gg/home-operations) community.

Special thanks to: [ᗪєνιη ᗷυнʟ](https://github.com/onedr0p/home-cluster), [Bᴇʀɴᴅ Sᴄʜᴏʀɢᴇʀs](https://github.com/bjw-s/k8s-gitops), and [Toboshii Nakama](https://github.com/toboshii/home-cluster) for their assistance.

Check out [kubesearch.dev](https://kubesearch.dev) to see what other users are running in their kubernetes home labs!
