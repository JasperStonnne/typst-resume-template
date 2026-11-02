# Typst Resume Template

A one-page English resume for a backend and infrastructure engineer, built with [Typst](https://typst.app/) and [`@preview/basic-resume:0.2.9`](https://typst.app/universe/package/basic-resume). Skill cards use [`@preview/showybox:2.0.4`](https://typst.app/universe/package/showybox). Profile icons are [Nerd Font](https://www.nerdfonts.com/) glyphs, and awards are loaded from YAML.

Licensed under the [MIT License](LICENSE). Copyright (c) 2026 JasperStonnne / ShiJingYuan.

The checked-in sample is placeholder content only: C and Go on Linux, key-value storage, networking, and systems work. It does not describe a real person.

## Files

- `resume.typ` — main resume source
- `awards.yaml` — structured competition and award data
- `LICENSE` — MIT license

## Build

Install [Typst](https://github.com/typst/typst), then run:

```sh
typst compile resume.typ
```

The generated PDF is gitignored (`*.pdf` in `.gitignore`).

## Customize

1. Replace the personal details near the top of `resume.typ` (name, phone, location, email, GitHub, and site).
2. Edit the education, experience, project, skills, and additional-information sections.
3. Update `awards.yaml` with your own awards. Each entry needs `name`, `level`, and `date`. Keep `date` quoted (for example `"2024.10"`) so it is not read as a number.
4. Profile highlight icons use Hack Nerd Font code points. Change each glyph and its label together. To use a logo instead, add an SVG under `img/` and reference it with `image()`.

## Privacy

All included content is generic placeholder text. Review the repository before publishing after adding your own personal information.
