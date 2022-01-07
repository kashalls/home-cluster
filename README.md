<div align="center">

# Kashall's Home Kubernetes Cluster
🖳 In-house kubernetes cluster built with k3s and managed by flux (gitops).

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

### Hardware

    - [Unifi Dream Machine Pro](https://store.ui.com/collections/unifi-network-unifi-os-consoles/products/udm-pro) configured with [Boostchickens's UDM Utilties](https://github.com/boostchicken/udm-utilities) and [My Util Scripts](https://github.com/Kashalls/udmp-utils).
    - 2x Dell Optiplex 790's w/ Intel i3-2320, 8GB Ram, 2x Samsung 860 Pro (256GB)
    - 1x Synology NAS DS412+ with 4GB Ram and 4x Seagate ST2000DM008-2FR102's with minio running in docker.

### Production
    Fiji
    - Ryzen 9 3900x
    - X470D4U
    - 2x F4-2666C19-32GNT (32GB ea.)
    - 2x CT1000P1SSD8 (ZFS-1)

    Poseidon
    - 2x Intel Xeon L5640 (2.27GHz)
    - Dell R710
    - 18x M393B5273CH0-YH9 (4GB ea.)



### Required Addons

I wrote a couple addons for this to work. These addons requires physical devices for them to work.

- [AirGradient Prometheus Server](https://github.com/Kashalls/airgradient-prometheus-sensor)

## Inspiration

Thanks to all the people who donate their time to the [Kubernetes @Home](https://github.com/k8s-at-home/) community.

Special thanks to: [ᗪєνιη ᗷυнʟ](https://github.com/onedr0p/home-cluster), [Bᴇʀɴᴅ Sᴄʜᴏʀɢᴇʀs](https://github.com/bjw-s/k8s-gitops), and [Toboshii Nakama](https://github.com/toboshii/home-cluster) for their assistance.
