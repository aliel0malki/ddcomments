# ddcomments
Blazingly Fast Comment Remover written in Zig for languages that use `//` and `/* */` for comments.

[![GitHub license](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/aliel0malki/ddcomments/blob/main/LICENSE)
![Build Status](https://github.com/aliel0malki/ddcomments/actions/workflows/release.yml/badge.svg?branch=main)
![Tests](https://github.com/aliel0malki/ddcomments/actions/workflows/tests.yml/badge.svg?branch=main)

## What It Does

- **Strip Comments**: Gets rid of single-line (`//`) and multi-line (`/* ... */`) comments without messing with your string literals.
- **Output Anywhere**: Choose where you want the cleaned files to go, so you can keep your workspace organized.

## Table of Contents
- [Getting Started](#getting-started)
- [How to Use](#how-to-use)
- [Contributing](#contributing)
- [License](#license)

## Getting Started

### Installition
just install the right binary for your system/architecture from [releases](https://github.com/aliel0malki/ddcomments/releases)


### Build from Source

```bash
git clone https://github.com/aliel0malki/ddcomments.git
cd ddcomments
zig build
```

## How to Use

Example:

```bash
ddcomments src output
```

`src` is the directory containing your code files.
`output` is the directory where you want the cleaned files to go.

## Contributing?
you welcome!

## next?
support for other languages

## License
This project is licensed under the MIT License - check out the [LICENSE](LICENSE) file for the nitty-gritty.
