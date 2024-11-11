// @ts-check
import { defineConfig } from 'astro/config';

import preact from "@astrojs/preact";
import tailwind from "@astrojs/tailwind";
import expressiveCode from "astro-expressive-code";
import icon from 'astro-icon';

import partytown from '@astrojs/partytown';

// https://astro.build/config
export default defineConfig({
  site: "https://example.com",
  integrations: [preact(), tailwind(), expressiveCode({
    themes: ['dracula', 'github-light'],
    styleOverrides: {
      codeFontSize: '.8em',
      frames: {
        shadowColor: '#124',
      },
    },
  }), icon(), partytown({
    config: {
      forward: ["dataLayer.push"],
    }
  })],
  markdown: {
  },
});