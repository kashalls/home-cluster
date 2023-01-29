export default defineAppConfig({
  docus: {
    title: 'Kashalls\'s Home Cluster',
    description: 'Basic documentation for my home ops cluster.',
    image: 'https://jordanjones.org/_nuxt/img/jordanjones-colored.94409ff.svg',
    socials: {
      twitter: 'kashalls',
      github: 'kashalls/home-cluster',
    },
    main: {
      padded: true,
      fluid: true
    },
    aside: {
      level: 0,
      collapsed: false,
      exclude: []
    },
    header: {
      logo: false,
      showLinkIcon: true,
      exclude: []
    },
    footer: {
      credits: {
        "icon": "la:money-bill-wave-alt",
        "text": "Maintained by Kashalls",
        "href": "https://kashall.dev"
      },
      iconLinks: [
        {
          href: 'https://discord.gg/k8s-at-home',
          icon: 'ic:baseline-discord'
        }
      ]
    },
    github: {
      dir: '/docs',
      repo: 'home-cluster',
      owner: 'kashalls',
      edit: true,
      branch: 'main'
    }
  }
})
