# Thematic

## purpose
I use [doom-emacs](https://github.com/doomemacs/doomemacs) for my editor.  There are many built-in themes available.  However, sometimes I want to take the palette of a theme and rearrange it so certain language features get highlighted differently.

One rearrangement I want is the ability to cycle through how comments are highlighted by the theme.  Some themes make comments more muted with low-contrast colors, others make them stand out.  But rather than search for an entirely new theme, I want to take an existing theme and re-map what color goes with comments.

Similarly, language keywords being highlighted makes sense for when someone is first learning what those keywords are (and sometimes this kind of highlighting is still valuable to experts to help them quickly scan and navigate the code).  But other times I want to highlight user-defined variables and functions so they appear bolder or higher contrast than the familiar built-in features of the language.

Or perhaps I want the punctuation marks of a langauge to stand out so I can quickly see where the math operations occur.

## implementation
I don't know how Emacs implements syntax highlighting and theming, but here's a naive and very rough approximation of how I would implement the "theme cycling" feature for this project:

1. gather language syntax features from the syntax parsing module
2. get the palette from the currently loaded theme
3. treat these as two separate lists
4. allow the user to select a permutation of the palette

For example, if the syntax highlighter identifies the following 5 language features:

- keywords
- built-in functions
- comments
- constants
- punctuation
- normal text

Then a corresponding theme would assign colors to all of these features, such as:

- keywords = #ff00ff
- built-in functions = #00ffff
- comments = #111111
- constants = #23ee82
- punctuation = #ffffff
- normal text = #ffffff

The theme would additionally define colors for things outside the scope of the language syntax, such as:

- background = #000000
- cursor color = #ee22ee

This mapping of theme concepts to colors is what I want to permute.  One approach would be to parse the current theme first, to establish the mapping it uses, then generate a permutation, and re-assign any colors changed by the permutation.

## possible issues
Emacs (and doom-emacs) themes might cache some settings, so even changing the current mapping of concepts to colors may have no effect.  If this is the case for the current theme, display an info message to the user that they need to reload emacs for the change to take effect.


## example theme

Here are some definitions used by the theme "doric-magma":

```elisp
(defvar doric-magma-palette
'((cursor "#ef3839")
  (bg-main "#351b10")
  (fg-main "#e0baa0")
  (border "#706061")
  
  (bg-shadow-subtle "#48332b")
  (fg-shadow-subtle "#a0a196")
  
  (bg-neutral "#5f4743")
  (fg-neutral "#cfbbb0")
  
  (bg-shadow-intense "#7c301c")
  (fg-shadow-intense "#ff9d7e")
  
  (bg-accent "#5a2914")
  (fg-accent "#f65f47")
  
  (fg-red "#fc826f")
  (fg-green "#b9c06a")
  (fg-yellow "#cfa030")
  (fg-blue "#7fafc7")
  (fg-magenta "#df70af")
  (fg-cyan "#70a0c0")
  
  (bg-red "#5f240f")
  (bg-green "#3f440f")
  (bg-yellow "#554600")
  (bg-blue "#3f2457")
  (bg-magenta "#5a2f40")
  (bg-cyan "#2f4954"))
"Palette of `doric-magma' theme.")
```

## example permutation

One valid permutation of the above theme is:

```elisp
(defvar doric-magma-palette
'((cursor "#ef3839")
  (bg-main "#351b10")
  (fg-main  "#706061")  ;; this color has been swapped...
  (border "#e0baa0")  ;; ...with this color
  
  (bg-shadow-subtle "#48332b")
  (fg-shadow-subtle "#a0a196")
  
  (bg-neutral "#5f4743")
  (fg-neutral "#cfbbb0")
  
  (bg-shadow-intense "#7c301c")
  (fg-shadow-intense "#ff9d7e")
  
  (bg-accent "#5a2914")
  (fg-accent "#f65f47")
  
  (fg-red "#fc826f")
  (fg-green "#b9c06a")
  (fg-yellow "#cfa030")
  (fg-blue "#7fafc7")
  (fg-magenta "#df70af")
  (fg-cyan "#70a0c0")
  
  (bg-red "#5f240f")
  (bg-green "#3f440f")
  (bg-yellow "#554600")
  (bg-blue "#3f2457")
  (bg-magenta "#5a2f40")
  (bg-cyan "#2f4954"))
"Palette of `doric-magma' theme.")
```
