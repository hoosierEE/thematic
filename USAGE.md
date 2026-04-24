# Usage Guide for Thematic

## Overview

The thematic package provides a theme swapping interface for Doom Emacs that allows users to cycle through theme permutations where exactly 2 theme items have swapped colors.

## Installation

1. Clone or download this repository into your Doom Emacs configuration directory:
   ```
   cd ~/.doom.d/local
   git clone https://github.com/alexshroyer/thematic.git
   ```

2. Add the following to your `~/.doom.d/config.el`:
   ```elisp
   (use-package thematic
     :load-path "~/.doom.d/local/thematic")
   ```

3. Run `doom sync` to install dependencies

## Key Features

### 1. Theme Toggling
- `M-x thematic-toggle-theme` - Toggle between original theme and a permuted version
- The permuted version swaps exactly 2 colors in the theme palette

### 2. Theme Management
- `M-x thematic-reset-theme` - Reset to the original theme state
- `M-x thematic-show-theme-state` - Display current theme state

### 3. Key Bindings (configured automatically)
- `SPC t p` - Toggle theme permutation
- `SPC t r` - Reset theme
- `SPC t s` - Show theme state

## How It Works

1. **Palette Extraction**: The package extracts the current theme's color palette
2. **Permutation Generation**: It generates a permutation where exactly 2 items have swapped colors
3. **Theme Application**: The permutation is applied to the current theme
4. **State Management**: Tracks whether you're in original or permuted state

## Example

Given a theme palette:
```
- keywords = #ff00ff
- built-in functions = #00ffff
- comments = #111111
- constants = #23ee82
- punctuation = #ffffff
- normal text = #ffffff
```

A valid permutation would swap comments and built-in functions:
```
- keywords = #ff00ff
- built-in functions = #111111  ;; swapped with comments
- comments = #00ffff          ;; swapped with built-in functions
- constants = #23ee82
- punctuation = #ffffff
- normal text = #ffffff
```

## Limitations

1. **Theme Caching**: Some themes may require Emacs reload to see changes
2. **Theme Compatibility**: Works best with themes that follow standard palette structures
3. **Performance**: For themes with very large palettes, the permutation generation may take longer

## Troubleshooting

### Theme Changes Not Taking Effect
If you don't see theme changes after using `thematic-toggle-theme`, try:
1. Restarting Emacs
2. Running `doom sync` to reload packages
3. Checking if the theme requires a specific reload mechanism

### Issues with Permutations
If you experience issues with permutations:
1. Check that your theme has at least 2 color mappings
2. Verify that the theme is properly loaded
3. Report any issues to the project repository

## Contributing

Contributions are welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License

MIT License