# CJK Fonts Package for Atom Editor

[![Build Status](https://travis-ci.org/jmlntw/atom-fonts-cjk.svg?branch=master)](https://travis-ci.org/jmlntw/atom-fonts-cjk)
[![Build status](https://ci.appveyor.com/api/projects/status/4oa8n75m8bf7dumw/branch/master?svg=true)](https://ci.appveyor.com/project/jmlntw/atom-fonts-cjk/branch/master)

**fonts-cjk** delivers better CJK (Chinese/Japanese/Korean) fonts to Atom editor without installing new fonts to system. Inspired by [braver/fonts](https://github.com/braver/fonts).

![A screenshot of fonts-cjk](https://raw.githubusercontent.com/jmlntw/atom-fonts-cjk/master/screenshot.gif)

## Features

* Fonts are packaged and loaded to Atom through the power of CSS (`@font-face`). No longer need to install them.
* Fonts can be applied to editor, Markdown Preview panel and workspace.

## Installation

Search for `fonts-cjk` in Atom settings view and install it or run `apm install fonts-cjk` from the command line.

## Available Fonts

| Font Name | License |
| --------- | ------- |
| [M+ FONTS](https://mplus-fonts.osdn.jp/) | Free |
| [Noto Sans CJK](https://www.google.com/get/noto/help/cjk/) | SIL Open Font License v1.1 |
| [Ricty Diminished](https://github.com/yascentur/RictyDiminished) | SIL Open Font License v1.1 |
| [Sarasa Gothic](https://github.com/be5invis/Sarasa-Gothic) | BSD 3-Clause License |

**Note:** Fonts have been subsetted to reduce the package size. You can specify an additional font for missing glyphs.

## License

* Codes are licensed under [MIT License](LICENSE.md).
* Different fonts have different licenses. See `resources/[font-name]/license.txt` for more information.
