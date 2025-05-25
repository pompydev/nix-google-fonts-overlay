{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dm-mono-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/dmmono/DMMono-Light.ttf?raw=true";
      name = "DMMono-Light.ttf";
      sha256 = "c7b3645dc8d28237317b4d017bc47b9ff09a7660758122dacb694a5a82552c24";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/dmmono/DMMono-LightItalic.ttf?raw=true";
      name = "DMMono-LightItalic.ttf";
      sha256 = "90216192555d56cd40857250bbd6d0e8130ddbd015992d584225d7f390849544";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/dmmono/DMMono-Regular.ttf?raw=true";
      name = "DMMono-Regular.ttf";
      sha256 = "55b4c98f123daebb3ed27947ba47b2af00554fc6284d639a540bcef5e6258ad2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/dmmono/DMMono-Italic.ttf?raw=true";
      name = "DMMono-Italic.ttf";
      sha256 = "32b5bad9cbce64eac6d05c8abbeb619317f7e4cb354e1c33db761adbfaae1b16";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/dmmono/DMMono-Medium.ttf?raw=true";
      name = "DMMono-Medium.ttf";
      sha256 = "fd327daf461db87b44a87def475d251bf03b997f7c07d9680592d75dbbfaad0b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/dmmono/DMMono-MediumItalic.ttf?raw=true";
      name = "DMMono-MediumItalic.ttf";
      sha256 = "a3b2211bb9cf5c4fc1a0b487553e673a737c2270c59b86bf1e0b48c77e587aa2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DMMono-Light.ttf $out/share/fonts/truetype/DMMono-Light.ttf
     install -Dm644 DMMono-LightItalic.ttf $out/share/fonts/truetype/DMMono-LightItalic.ttf
     install -Dm644 DMMono-Regular.ttf $out/share/fonts/truetype/DMMono-Regular.ttf
     install -Dm644 DMMono-Italic.ttf $out/share/fonts/truetype/DMMono-Italic.ttf
     install -Dm644 DMMono-Medium.ttf $out/share/fonts/truetype/DMMono-Medium.ttf
     install -Dm644 DMMono-MediumItalic.ttf $out/share/fonts/truetype/DMMono-MediumItalic.ttf
  '';

  meta = with lib; {
    description = "DM Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
