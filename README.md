# Orest's Resume Template

This is a clean, minimal resume template built in [Typst](https://typst.app), designed to be highly customizable and visually professional. Strongly inspired by [stuxf's basic-typst-resume-template](https://github.com/stuxf/basic-typst-resume-template).

## Requirements

- [Typst compiler](https://typst.app/docs/install/)
- [`just`](https://github.com/casey/just) task runner (For Development)

## Usage

To install this template as a reusable local Typst package:

### 1. Clone into Typst’s local package directory

On **macOS**, Typst stores local packages under:

```bash
~/Library/Application\ Support/typst/packages/local
```

To install this resume package, clone it directly into the correct location:

```bash
git clone https://github.com/oresttokovenko/orest-tokovenko-resume.git \
  ~/Library/Application\ Support/typst/packages/local/orest-tokovenko-resume@0.1.0
```

### 2. Import and use in Typst

```typst
#import "@local/orest-tokovenko-resume:0.1.0": *

#show: resume.with(
  author: "Jane Doe",
  email: "jane@example.com",
  ...
)
```

### Notes
- The folder must match the pattern `PACKAGENAME@VERSION`, e.g., `orest-tokovenko-resume@0.1.0`.
- Typst will automatically detect and use this package if it’s in the right directory.
