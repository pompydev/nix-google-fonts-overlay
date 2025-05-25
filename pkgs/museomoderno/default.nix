{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "museomoderno-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/museomoderno/MuseoModerno%5Bwght%5D.ttf?raw=true";
      name = "MuseoModerno_wght_.ttf";
      sha256 = "d03b027cf5cf72d014c8a405a8ceb83ea1d5d8ae2c64a7f602b131d9973e3503";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/museomoderno/MuseoModerno-Italic%5Bwght%5D.ttf?raw=true";
      name = "MuseoModerno-Italic_wght_.ttf";
      sha256 = "ff123989a6c175cd3fce6b3decba302d3841d65d9839ec09dd0c850bea212b56";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MuseoModerno_wght_.ttf $out/share/fonts/truetype/MuseoModerno_wght_.ttf
     install -Dm644 MuseoModerno-Italic_wght_.ttf $out/share/fonts/truetype/MuseoModerno-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "MuseoModerno";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
