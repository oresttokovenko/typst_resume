# Orest's Resume Template

This is a clean, minimal resume template built in [Typst](https://typst.app), designed to be highly customizable and visually professional. Strongly inspired by [stuxf's basic-typst-resume-template](https://github.com/stuxf/basic-typst-resume-template).

## Requirements

- [Typst compiler](https://typst.app/docs/install/)
- [`just`](https://github.com/casey/just) task runner (For Development)

## Usage

To install this template as a reusable local Typst package:

### 1. Copy to Typst’s local package directory

```bash
~/.local/share/typst/packages/local/orest-tokovenko-resume
```

### 2. Import and use in Typst

```typst
#import "@local/typst_resume": *

#show: resume.with(
  author: "Jane Doe",
  email: "jane@example.com",
  ...
)
```

You can now reuse the template across projects without copying files



