{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nunito-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/nunito/Nunito%5Bwght%5D.ttf?raw=true";
      name = "Nunito_wght_.ttf";
      sha256 = "bb55a5ca5c2042335b3991af27c4d0705d0ef41cac6164ac737fd8f2a1e85207";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/nunito/Nunito-Italic%5Bwght%5D.ttf?raw=true";
      name = "Nunito-Italic_wght_.ttf";
      sha256 = "b520cc871868b0acfca1beda875df7f4a44ebce914f8a89f83977fc9c09529c8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Nunito_wght_.ttf $out/share/fonts/truetype/Nunito_wght_.ttf
     install -Dm644 Nunito-Italic_wght_.ttf $out/share/fonts/truetype/Nunito-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Nunito";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
