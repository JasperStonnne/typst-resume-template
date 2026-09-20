# Typst Resume Template

A one-page English resume built with [Typst](https://typst.app/), based on the `basic-resume` package and enhanced with custom profile-highlight cards, icon assets, and YAML-driven awards.

## Files

- `resume.typ` — main resume source
- `awards.yaml` — structured competition and award data
- `img/` — logos and icons used by the resume

## Build

Install Typst, then run:

```sh
typst compile resume.typ
```

The generated PDF is intentionally ignored by Git.

## Customize

1. Replace the personal details near the top of the `.typ` file.
2. Edit the education, experience, project, and additional-information sections.
3. Update `awards.yaml` with your own awards.
4. Replace or remove the SVG assets in `img/` as needed.

## Privacy

All included content is generic placeholder text. Review the repository before publishing after adding your own personal information.
