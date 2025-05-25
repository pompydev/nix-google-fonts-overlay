{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "source-serif-4-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sourceserif4/SourceSerif4%5Bopsz,wght%5D.ttf?raw=true";
      name = "SourceSerif4_opsz,wght_.ttf";
      sha256 = "97b2d4da6e3cb494b5a1e66ae176914d852ccabef49e0c02c0df25f3e39aca0b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sourceserif4/SourceSerif4-Italic%5Bopsz,wght%5D.ttf?raw=true";
      name = "SourceSerif4-Italic_opsz,wght_.ttf";
      sha256 = "15fbc7e4679489a501998c3669272637a6646388ef7e4bd77eebb5bf967a1f42";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SourceSerif4_opsz-wght_.ttf $out/share/fonts/truetype/SourceSerif4_opsz-wght_.ttf
     install -Dm644 SourceSerif4-Italic_opsz-wght_.ttf $out/share/fonts/truetype/SourceSerif4-Italic_opsz-wght_.ttf
  '';

  meta = with lib; {
    description = "Source Serif 4";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
