---
to: package.json
---
{
  "name": "@goldenshun/<%= name %>",
  "version": "0.0.1",
  "description": "<%= name %>",
  "private": true,
  "main": "index.js",
  "scripts": {
    "prebuild": "npm run gen:gql",
    "build": "next build",
    "gen:gql": "dotenv -c -- graphql-codegen",
    "gen:gql:watch": "npm run gen:gql -- --watch",
    "dev": "concurrently \"next\" \"npm run gen:gql:watch\"",
    "fauna": "fauna-gql",
    "fauna:override": "fauna-gql --override",
    "lint": "eslint --ext .js .",
    "start": "next start"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/goldenshun/<%= name %>.git"
  },
  "author": "Sean Connolly",
  "license": "MIT",
  "homepage": "https://github.com/goldenshun/<%= name %>#readme"
}
