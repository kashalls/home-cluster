export default defineNuxtConfig({
  extends: '@nuxt-themes/docus',
  nitro: {
    preset: 'cloudflare_pages'
  },
  app: {
    head: {
      script: [
        { defer: true, src: 'https://shy.ok8.sh/ingress/64e792ac-996a-4cd5-ba0a-3b5ee47bd2c1/script.js' }
      ],
      noscript: [
        { children: '<img src="https://shy.ok8.sh/ingress/64e792ac-996a-4cd5-ba0a-3b5ee47bd2c1/pixel.gif">'}
      ]
    }
  }
})
