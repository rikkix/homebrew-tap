# Homebrew Tap

A collection of Homebrew formulae and casks for software developed and maintained by Rikki.

## Getting Started

Add this tap to Homebrew:

```sh
brew tap rikki/tap https://git.rikki.moe/rikki/homebrew-tap.git
```

The URL is needed because the tap isn't hosted on GitHub.

## Installation

Install a formula:

```sh
brew install <formula>
```

Install a cask:

```sh
brew install --cask <cask>
```

Alternatively, install a package directly without manually adding the tap:

```sh
brew install rikki/tap/<formula>
```

## Updates

Update Homebrew and upgrade installed packages:

```sh
brew update
brew upgrade
```

## Available Packages

### Formulae

- [`iprober`](./Formula/iprober.rb) — [iProber](https://git.rikki.moe/rikki/iprober), a TCP service inventory tool (Apple Silicon macOS, Linux AMD64 and ARM64).

```sh
brew install rikki/tap/iprober
```

### Casks

- [`marker`](./Casks/marker.rb) — [Marker](https://git.rikki.moe/rikki/Marker), a Markdown and Typst editor that exports LaTeX-quality PDFs (macOS 27, Apple silicon).

```sh
brew install --cask rikki/tap/marker
```

## Removing the Tap

```sh
brew untap rikki/tap
```

## License

Each package is subject to its respective software license.
