# Usage

## Requirements

- [Typst compiler](https://github.com/typst/typst#usage)
- [`just`](https://github.com/casey/just) task runner (for development)
- [Inter font](https://rsms.me/inter/) (includes Inter Display)

### Installing Inter font

On macOS with Homebrew:

```bash
brew install --cask font-inter
```

On Linux, download from [GitHub releases](https://github.com/rsms/inter/releases) or use your package manager.

## Local Installation

To install this template as a reusable local Typst package:

### 1. Clone into Typst's local package directory

On macOS, Typst stores local packages under:

```bash
~/Library/Application\ Support/typst/packages/local
```

To install this resume package, clone it directly into the correct location:

```bash
git clone https://github.com/oresttokovenko/git-hired \
  ~/Library/Application\ Support/typst/packages/local/git-hired/0.1.0
```

### 2. Import and use in Typst

```typst
#import "@local/git-hired:0.1.0": *

#show: resume.with(
  author: "Jane Doe",
  email: "jane@example.com",
  ...
)
```

### Notes

- The folder must match the pattern `PACKAGENAME/VERSION`, e.g., `git-hired/0.1.0`
- Typst will automatically detect and use this package if it's in the right directory

## Development

Run `just --list` to see available commands:

- `just watch-job-title-primary` - watch job-title-primary test file
- `just watch-company-primary` - watch company-primary test file
- `just build` - compile both test PDFs
