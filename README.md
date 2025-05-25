# Nix Google Fonts Overlay 🎁

**1414 high-quality fonts packaged for Nix**

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
    builtins.fetchTarball {
      url = "https://github.com/pompydev/nix-google-fonts-overlay/archive/dfb84823efeb84314f8186cb2014edf05136b527.tar.gz";
      sha256 = "sha256:01cpfyzd4xl3a462jyn2xn22hn6i1my1svyag7926r3r2vmck24y";
    }
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
