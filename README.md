
# Travel Timeline — Jekyll Starter (Dark, Clean)

This repo is a **GitHub Pages–ready** Jekyll site that renders a **vertical, date-based timeline** for daily travel posts. It uses the **Minimalistic** theme (dark/light) and a small include for the timeline UI.

## Quick start

1. **Create a new repo** on GitHub (public).
2. Upload these files (or upload the ZIP).
3. Go to **Settings → Pages**:
   - **Source**: "Deploy from a branch"
   - **Branch**: `main` (root), then **Save**.
4. Your site will build in a minute. Visit the Pages URL.
5. Start adding daily posts in `_posts/` — the **Timeline** page will pick them up automatically.

## Local development

```bash
bundle install
bundle exec jekyll serve
```
Then open http://127.0.0.1:4000

## Writing posts

Create files in `_posts` like:

```
2025-02-03-day-17-hoi-an.md
```

With front matter like:

```yaml
---
layout: post
title: "Day 17 — Hoi An lanterns"
date: 2025-02-03
location: "Hoi An, Vietnam"
cover_image: /assets/images/hoi-an/lanterns.jpg
summary: "Lantern workshops, old town wandering, and cau lao noodles."
tags: [vietnam, hoi-an, food]
---

Write your day’s story here. Add images with Markdown:

![Lanterns](/assets/images/hoi-an/lanterns.jpg)
```

## Timeline

The Timeline page (`/timeline/`) lists posts in reverse-chronological order in a **vertical** timeline. You can customize the look in `assets/css/timeline.css` and markup in `_includes/travel-timeline.html`.

