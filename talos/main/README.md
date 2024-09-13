# Talos Configuration for Main

`{controlplane|worker}.secret.sops.yaml`

Sops encrypted configurations for Talos. These are generated using the [Configure Talos Linux](https://www.talos.dev/v1.7/introduction/getting-started/#configure-talos-linux) section.

Only some of the values have been encrypted, so other users could see how my node(s) are configured.

`helmfile.yaml`

These are applications that needed to be ran while the node is being bootstrapped. Some of the initial applications are disabled by default as they are hardcoded versions and only update when the Talos version does.



### Talos MS-01 Required Extensions
- siderolabs/binfmt-misc
- siderolabs/intel-ucode
- siderolabs/thunderbolt
- siderolabs/util-linux-tools

### Talos MS-01 Optional Extensions
- siderolabs/v4l-uvc-drivers

### Talos Kernel Command Line Arguments
- `mitigations=off`
