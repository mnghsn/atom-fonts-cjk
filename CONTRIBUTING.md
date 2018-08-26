# Contributing
> Do One Thing and Do It Well

## Style Guide

### Syntax

* Use [EditorConfig](https://editorconfig.org/) to define and maintain consistent coding styles.
* Use 2 spaces indentation.
* Use UTF-8 encoding without BOM.
* Use Unix-style line endings (`LF`).
* End files with a newline.
* Remove any trailing whitespace characters except in Markdown files where a line-break must be forced.
* Keep line length less than 120 characters, preferably less than 80 characters.
* When in doubt, follow the conventions you see used in the source already.

### Git Commit Messages

* Use the present tense. (“Add feature” not “Added feature”.)
* Use the imperative mood. (“Move cursor to...” not “Moves cursor to...”.)
* Capitalize the summary line (first line).
* Do not end the summary line with a period.
* Limit the summary line to 50 characters or less.
* Always leave the second line blank.
* Wrap the description at 72 characters.
* Reference issues and pull requests liberally.

## Issue Reporting Guidelines

* Bugs and enhancement suggestions are tracked as [GitHub issues](https://guides.github.com/features/issues/).
* Try to search for your issue before submitting it. It may have already been answered or fixed.
* Check if the issue is reproducible with the last stable version.
* Use a clear and descriptive title for the issue.
* When reporting a bug, describe the exact steps which reproduce the problem.
* Include screenshots whenever possible.
* Include your environment like Atom version and OS version.

## Pull Request Guidelines

* Create a topic branch from `master`.
* Squash the commit if there are too many small ones.
* Make sure `apm --test` passes. (See [Development Setup](#development-setup).)
* If adding a new feature, provide convincing reasons to add this feature.
* If fixing a bug, provide a detailed description in the PR.

## Development Setup

```bash
# Fork and clone this repository.
$ git clone https://github.com/<username>/atom-fonts-cjk.git
$ cd atom-fonts-cjk

# Run Atom package specs to make sure everything works fine.
$ atom --test --timeout 60 ./spec/
```

For more information about Atom package specs, see [Hacking Atom: Writing specs](https://flight-manual.atom.io/hacking-atom/sections/writing-specs/) section in the [Atom Flight Manual](https://flight-manual.atom.io/).
