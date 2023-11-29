# Kairos

Currently testing out automated deployments with Kairos. Looks interesting.

Auroraboot is running as a custom app on truenas scale.

- Application Name: auroraboot
- Version: 2308.0.1
- Image Repository: quay.io/kairos/auroraboot
- Image Tag: latest

- Container Environment Variables:
  - container_image: quay.io/kairos/kairos-debian:v2.4.1-k3sv1.27.3-k3s1
- Host Network
  - Static
    - 10.1.0.70/24
