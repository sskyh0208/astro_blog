---
layout: ../../layouts/MarkdownPostLayout.astro
title: BlogのUIを大幅にカスタマイズ
pubDate: 2024-11-05
description: 'よいよ、見た目をいじってブログっぽくしてみる。'
author: 'Astro学習者'
image:
    url: "https://docs.astro.build/default-og-image.png"
    alt: "惑星と星のイラストの中にastroという単語があります。"
tags: ["astro"]
---

# 大改造

## はじめに

いよいよブログの見た目を改造してみる。

```js
const { default: MarkdownPostLayout } = await import('../../layouts/MarkdownPostLayout.astro')
```