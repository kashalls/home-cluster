# Kasha

- [📄 Documentation](https://home-cluster.pages.dev)
- [⚡️ Clone Template](https://github.com/onedr0p/flux-cluster-template)


## What is this?

Arisu is the name of the kubernetes cluster I deployed at home. It features a couple of low power consumer machines running [Ubuntu Server](https://ubuntu.com/server) with [k3s](https://k3s.io/) deployed using my [ansible configuration](/ansible/).

This repo serves as the "roadmap" that is automatically updated and deployed thanks to [renovate](https://www.mend.io/renovate/) and [fluxcd](https://fluxcd.io/).

## How did you do this?

Thanks to [onedr0p](https://github.com/onedr0p), there is the [flux cluster template](https://github.com/onedr0p/flux-cluster-template) that allows you to get started with your own kubernetes cluster at home. You don't need to have multiple computers or a fancy setup to get one working.

If you're interested, you can also join on [Discord](https://discord.com) with [https://discord.gg/k8s-at-home](https://discord.gg/k8s-at-home). Several people are involved daily and it makes for some interesting conversations.


## ☁️ Cloud Dependencies

While most of my infrastructure and workloads are self-hosted I do rely upon the cloud for certain key parts of my setup. This saves me from having to worry about two things. (1) Dealing with chicken/egg scenarios and (2) services I critically need whether my cluster is online or not.

| Service                                         | Use                                                               | Cost           |
|-------------------------------------------------|-------------------------------------------------------------------|----------------|
| [1Password](https://1password.com/)             | Secrets with [External Secrets](https://external-secrets.io/)     | ~$65/yr        |
| [Cloudflare](https://www.cloudflare.com/)       | Domain and R2                                                     | ~$30/yr        |
| [Frugal](https://frugalusenet.com/)             | Usenet access                                                     | ~$35/yr        |
| [GCP](https://cloud.google.com/)                | Voice interactions with Home Assistant over Google Assistant      | Free           |
| [GitHub](https://github.com/)                   | Hosting this repository and continuous integration/deployments    | Free           |
| [Migadu](https://migadu.com/)                   | Email hosting                                                     | ~$20/yr        |
| [NextDNS](https://nextdns.io/)                  | My router DNS server which includes AdBlocking                   | ~$20/yr        |
| [Pushover](https://pushover.net/)               | Kubernetes Alerts and application notifications                   | Free           |
| [Terraform Cloud](https://www.terraform.io/)    | Storing Terraform state                                           | Free           |
| [UptimeRobot](https://uptimerobot.com/)         | Monitoring internet connectivity and external facing applications | ~$60/yr        |
|                                                 |                                                                   | Total: ~$20/mo |
---

## 🌐 DNS

My main opnsense


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
| Fran (Custom Nas)           | 1     | 2x2TB SSD    | 5x8TB (raidz2)              | 64GB | True NAS Scale   | NFS + Backup Server |
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

Thanks to all the people who donate their time to the [Kubernetes @ Home](https://github.com/k8s-at-home/) community.

Special thanks to: [ᗪєνιη ᗷυнʟ](https://github.com/onedr0p/home-cluster), [Bᴇʀɴᴅ Sᴄʜᴏʀɢᴇʀs](https://github.com/bjw-s/k8s-gitops), and [Toboshii Nakama](https://github.com/toboshii/home-cluster) for their assistance.
