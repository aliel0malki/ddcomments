# ddcomments

Fast asf Comment Remover written in Zig for languages that use `//` and `/* */` for comments.

*gonna support more soon......*

## What It Does

- **Strip Comments**: Gets rid of single-line (`//`) and multi-line (`/* ... */`) comments without messing with your string literals.
- **Cross-Platform**: Works on different architectures like `aarch64` and `x86_64`, so no matter your setup, we got you covered!
- **Output Anywhere**: Choose where you want the cleaned files to go, so you can keep your workspace organized.

## Table of Contents

- [Getting Started](#getting-started)
- [How to Use](#how-to-use)
- [Contributing](#contributing)
- [License](#license)

## Getting Started

### Installition

just install the right binary for your system/architecture from release page :
[here](https://github.com/aliel0malki/ddcomments/releases)


### Build from Source

First, get the code on your machine:

```bash
git clone https://github.com/yourusername/ddcomments.git
cd ddcomments
```

Now, let's build it:

```bash
zig build
```

## How to Use

Example:

```bash
ddcomments __tests__ output
```

`__tests__` is the directory containing your code files.
`output` is the directory where you want the cleaned files to go.

## Contributing?

you welcome!

## License

This project is licensed under the MIT License - check out the [LICENSE](LICENSE) file for the nitty-gritty.
