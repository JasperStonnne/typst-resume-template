# Typst Resume Template

Open-source Typst resume template. The restored layout follows the original compact style: a profile-highlight icon row and four showybox skill cards. Licensed under the MIT License; see [LICENSE](LICENSE).

The checked-in sample is fictional anonymized placeholder content for a backend and infrastructure student (storage, networking, and systems). It is not a real person. Do not ship real PII.

## Layout

- Top-right smallcaps season badge
- Profile Highlights: Nerd Font icon row with a matching label row
- Four showybox skill cards in a 2×2 table with a center rule
- Project blocks with an italic organization line, a short bold summary, and bullets
- Awards heading with a small grey note, filled from `awards.yaml`

`resume.typ` defines the helpers `sub`, `awards-list`, and `skills-box`. It imports `@preview/basic-resume:0.2.9` and `@preview/showybox:2.0.4`.

## Build

Install [Typst](https://typst.app/), then run:

```sh
typst compile resume.typ
```

`*.pdf` is listed in `.gitignore`, so the generated PDF is not committed. Warnings about a missing Nerd Font or KaiTi are safe to ignore. Install [Hack Nerd Font](https://www.nerdfonts.com/) if you want the icon row to render.

## Files

- `resume.typ` — layout, helpers, and the fictional sample
- `awards.yaml` — fictional contests and scholarships
- `LICENSE` — MIT License
- `.gitignore` — ignores `*.pdf`, logs, and macOS junk

No `img/` directory is included. The sample icon row uses Nerd Font glyphs only. Add `img/` later if your own `resume.typ` references SVG files.

## Customize

1. Replace the placeholder name, phone, email, and links at the top of `resume.typ`.
2. Edit education, experience, projects, and the closing section.
3. Update `awards.yaml`. Quote dates such as `"2026.05"` so Typst does not read them as floats.

Review the repository before publishing. Remove phone numbers, personal emails, and any other identifiers you do not want public.
