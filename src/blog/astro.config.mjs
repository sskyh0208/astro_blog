// @ts-check
import { defineConfig } from 'astro/config';

import preact from "@astrojs/preact";
import tailwind from "@astrojs/tailwind";
import expressiveCode from "astro-expressive-code";
import rehypeToc from 'rehype-toc';
import remarkToc from 'remark-toc';

import icon from 'astro-icon';

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
  }), icon()],
  markdown: {
    // remarkPlugins: [
    //   remarkToc,
    // ],
    // rehypePlugins: [
    //   rehypeToc,
    // ],
  },
});