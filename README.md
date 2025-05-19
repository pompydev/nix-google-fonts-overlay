# Nix Google Fonts Overlay 🎁

**1920 high-quality fonts packaged for Nix**

This [Nix overlay](https://nixos.org) allows you to use fonts in
[github.com/google/fonts](https://github.com/google/fonts). Updated weekly.

## Examples

```nix
{
  config,
  pkgs,
  lib,
  ...
}:

let
  fontsOverlay = import (
    builtins.fetchTarball "https://github.com/pompydev/nix-google-fonts-overlay/archive/master.tar.gz"
  );
in
{
  nixpkgs.overlays = [ fontsOverlay ];

  fonts.fonts = with pkgs; [
    google-fonts-eb-garamond
    google-fonts-exo
    google-fonts-lobster
  ];
}
```
