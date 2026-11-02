# Typst Resume Template

Open-source Typst resume template. The sample is fictional placeholder content for a backend and infrastructure student. Do not ship real PII.

The layout is a compact English resume: a season badge, an icon row, four showybox skill cards, project subtitle lines, and a YAML awards list.

## Build

Install [Typst](https://typst.app/), then run:

```sh
typst compile resume.typ
```

Warnings about a missing Nerd Font or KaiTi are safe to ignore. Install [Hack Nerd Font](https://www.nerdfonts.com/) if you want the profile-highlight icons to render. The generated PDF is ignored by Git.

## Files

- `resume.typ` — layout, helpers (`sub`, `awards-list`, `skills-box`), and the fictional sample
- `awards.yaml` — sample contests and scholarships

Packages: `@preview/basic-resume:0.2.9` and `@preview/showybox:2.0.4`.

Optional SVG icons can live in `img/` and be referenced from the highlight row. The sample uses Nerd Font glyphs only, so no image assets are shipped.

## Customize

1. Replace the placeholder name, phone, email, and links at the top of `resume.typ`.
2. Edit education, experience, projects, and the closing section.
3. Update `awards.yaml`. Quote dates such as `"2026.05"` so Typst does not read them as floats.

Review the repository before publishing. The checked-in text is a sample, not a real person. Remove phone numbers, personal emails, and any other identifiers you do not want public.
