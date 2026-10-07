# Diver

Build, launch and document deeplinks. See [usediver.com](https://usediver.com/).

This repository is where the desktop builds of Diver are published. It holds no
source code: each [release](https://github.com/SaaS-To-Bentley/homebrew-diver/releases)
carries the macOS and Windows builds, and the files here tell Homebrew and
Chocolatey where to find them.

## Install

**macOS** (12 or later), with [Homebrew](https://brew.sh):

```sh
brew install --cask saas-to-bentley/diver/diver
```

**Windows** (64-bit), with [Chocolatey](https://chocolatey.org):

```powershell
choco install diver
```

Both upgrade with the rest of what the package manager installed —
`brew upgrade` and `choco upgrade all`. Or download the DMG or the zip from the
[latest release](https://github.com/SaaS-To-Bentley/homebrew-diver/releases/latest).

## What is here

| Path | What it is |
| --- | --- |
| `Casks/diver.rb` | The Homebrew cask |
| `chocolatey/` | The source of the Chocolatey package |

Every file is written by Diver's release workflow, so a change made here by
hand is undone by the next release.
