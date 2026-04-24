# Thematic

A theme swapping interface for Doom Emacs that allows users to cycle through theme permutations where exactly 2 theme items have swapped colors.

## Purpose

I use [doom-emacs](https://github.com/doomemacs/doomemacs) for my editor. There are many built-in themes available. However, sometimes I want to take the palette of a theme and rearrange it so certain language features get highlighted differently.

One rearrangement I want is the ability to cycle through how comments are highlighted by the theme. Some themes make comments more muted with low-contrast colors, others make them stand out. But rather than search for an entirely new theme, I want to take an existing theme and re-map what color goes with comments.

Similarly, language keywords being highlighted makes sense for when someone is first learning what those keywords are (and sometimes this kind of highlighting is still valuable to experts to help them quickly scan and navigate the code). But other times I want to highlight user-defined variables and functions so they appear bolder or higher contrast than the familiar built-in features of the language.

Or perhaps I want the punctuation marks of a language to stand out so I can quickly see where the math operations occur.

## Features

- Toggle between the current theme and a permutation with exactly 2 colors swapped
- Preserves all other theme elements while only changing two color mappings
- Simple user interface with toggle command

## Installation

1. Clone this repository into your Doom Emacs configuration
2. Add the following to your `~/.doom.d/config.el`:
   ```elisp
   (use-package thematic
     :load-path "~/.doom.d/local/thematic")
   ```
3. Run `doom sync` to install dependencies

## Usage

- `M-x thematic-toggle-theme` - Toggle between original theme and permuted theme
- `M-x thematic-reset-theme` - Reset to original theme state
- `M-x thematic-show-theme-state` - Show current theme state

## Implementation Details

The package works by:

1. Extracting the current theme's color palette
2. Generating a permutation where exactly 2 items have swapped colors
3. Applying the permutation to the current theme
4. Providing a toggle mechanism to switch between original and permuted states

## Example

For a theme with the following palette:
```
- keywords = #ff00ff
- built-in functions = #00ffff
- comments = #111111
- constants = #23ee82
- punctuation = #ffffff
- normal text = #ffffff
```

A valid permutation would be:
```
- keywords = #ff00ff
- built-in functions = #111111  ;; swapped with comments
- comments = #00ffff          ;; swapped with built-in functions
- constants = #23ee82
- punctuation = #ffffff
- normal text = #ffffff
```

## License

Apache-2.0
