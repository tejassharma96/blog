
# Travel Timeline — Jekyll Starter (Dark, Clean) — v2

This is a **GitHub Pages–ready** Jekyll starter with:
- A **site-wide vertical timeline** page (lists posts by date)
- A **per-post (Day) internal timeline** include to show events like breakfast, zoo, etc.

## Quick start (GitHub Pages)
1) Create a repo and upload these files (or unzip).  
2) Settings → Pages → Source: *Deploy from a branch*; Branch: `main` (root).  
3) Visit your Pages URL after it builds.

## Run locally
> **Ruby TLS note (mise installs):** some Ruby builds ship without a populated cert store, causing `jekyll-remote-theme` downloads to fail with `certificate verify failed (unable to get certificate CRL)`. Until Ruby is rebuilt with proper CA paths, preload the provided patch so HTTPS works.

```bash
bundle install
RUBYOPT=-r./config/ssl_cert_store_patch bundle exec jekyll serve
```

## Write a post with per-day events
Add a post in `_posts/` with front matter like:

```yaml
---
layout: post
title: "Day 1 — Honolulu"
date: 2025-01-07
location: "Honolulu, Hawaii"
cover_image: /assets/images/honolulu/waikiki.jpg
summary: "Beach morning, zoo afternoon, malasadas at night."
events:
  - title: "Breakfast"
    time: "08:00"
    text: |
      I went out to XYZ and ate **yxz**. Great coffee.
    photos:
      - /assets/images/day1/breakfast.jpg
  - title: "Zoo"
    time: "13:30"
    text: |
      I went to the zoo and saw these animals...
    photos:
      - /assets/images/day1/zoo-1.jpg
---

Intro paragraph for the day.

{% include day-timeline.html events=page.events %}
```

- Global timeline page is at `/timeline/`.
- Customize styles in `assets/css/timeline.css` and `assets/css/day-timeline.css`.


## Per-post event media

Each event supports a `media:` array. You can mix images and videos:

```yaml
events:
  - title: "Zoo"
    text: |
      Afternoon at the zoo.
    media:
      - /assets/images/day3/zoo-1.jpg
      - /assets/videos/day3/zoo.mp4
      - type: youtube
        id: dQw4w9WgXcQ
```

- String items are treated by extension: `.jpg/.png/...` → image, `.mp4/.webm/.mov` → video.
- Objects support `{src, kind: 'video'}` or `{type: 'youtube', id: '...'}`.


### Lightbox navigation & captions
- Click an image or video to open the lightbox.
- Use **←/→** to move between media items within the **same event**.
- Add captions with `caption:` on media objects:

```yaml
events:
  - title: "Zoo"
    text: "Afternoon at the zoo"
    media:
      - src: /assets/images/day3/zoo-1.jpg
        caption: "Giraffe feeding time"
      - src: /assets/videos/day3/zoo.mp4
        kind: video
        caption: "Short clip of the aviary"
      - type: youtube
        id: dQw4w9WgXcQ
        caption: "A related video on birds"
```


## Lazy loading & Map embeds

- Images in event media use `loading="lazy"`. Videos default to `preload="metadata"` in the grid (full load only in lightbox).
- You can embed maps per event in a few ways:

```yaml
events:
  - title: "Morning walk"
    text: "Around Waikiki"
    media:
      - type: map
        place: "Honolulu Zoo"           # builds Google Maps embed
        caption: "Route near the zoo"
  - title: "Lunch"
    text: "Saimin spot"
    media:
      - type: map
        lat: 21.281
        lng: -157.837                   # builds Google Maps embed from coords
  - title: "Evening"
    text: "Beachfront"
    media:
      - type: map
        src: "https://www.openstreetmap.org/export/embed.html?bbox=..."  # any embed URL you prefer
        caption: "Beach area"
```


## Event chips (locations/tags)
You can display small **chips** under each event title. Supply any of these in the event front matter:

```yaml
events:
  - title: "Breakfast"
    text: "Cafe run"
    # simplest: list of strings
    chips: ["Waikiki", "Kuhio Ave"]
  - title: "Zoo"
    text: "Animals!"
    # object chips with links
    chips:
      - label: "Honolulu Zoo"
        url: "https://maps.google.com/?q=Honolulu+Zoo"
      - label: "Kapiolani Park"
        url: "https://maps.google.com/?q=Kapiolani+Park"
  - title: "Evening"
    text: "Beachfront"
    # convenience: also accepts 'place' or 'location' (string)
    place: "Queen's Beach"
```

You can also set `tags:` at the event level and they’ll be used as chips (strings only).
