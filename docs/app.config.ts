export default defineAppConfig({
  docus: {
    title: 'Home Ops',
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
      exclude: []
    },
    header: {
      logo: true,
      showLinkIcon: true,
      exclude: []
    },
    footer: {
      credits: {
        "icon": "",
        "text": "Maintained by Kashalls",
        "href": "https://kashall.dev"
      },
      iconLinks: [
        {
          href: 'https://nuxt.com',
          icon: 'IconNuxtLabs'
        }
      ]
    }
  }
})
