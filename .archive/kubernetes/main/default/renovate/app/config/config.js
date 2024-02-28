module.exports = {
  // https://docs.renovatebot.com/self-hosted-configuration

  // Customization
  "username": "moonami-bot[bot]",
  "dependencyDashboardTitle": "Moonami Dashboard 🌙",
  "gitAuthor": "Moonami Bot <138733633+moonami-bot[bot]@users.noreply.github.com>",

  // Prefered options
  "platform": "github",
  "requiredConfig": "optional",
  "extends": [
    'config:best-practices',
    'docker:enableMajor',
    ':gitSignOff',
    ':semanticCommits',
    ':automergeDigest',
    ':automergeBranch',
    ':disableRateLimiting'
  ],

  // Commit Messages
  "commitMessageTopic": "{{depName}}",
  "commitMessageExtra": "to {{newVersion}}",
  "commitMessageSuffix": "",

  "packageRules": [
    {
      "matchDatasources": ["helm"],
      "commitMessageTopic": "chart {{depName}}"
    },
    {
      "matchDatasources": ["docker"],
      "commitMessageTopic": "image {{depName}}"
    }
  ]
}
