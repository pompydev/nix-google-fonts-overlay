{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bodoni-moda-sc-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bodonimodasc/BodoniModaSC%5Bopsz,wght%5D.ttf?raw=true";
      name = "BodoniModaSC_opsz,wght_.ttf";
      sha256 = "fff815c5b6fb7da048acd9ca59a1b6a5751cf454cb701cd8185a2a0bf06d63ef";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bodonimodasc/BodoniModaSC-Italic%5Bopsz,wght%5D.ttf?raw=true";
      name = "BodoniModaSC-Italic_opsz,wght_.ttf";
      sha256 = "303868aeaf81bf6c71ca63ac32669da9c9de7f73343e34a18893d3b5e58e672e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BodoniModaSC_opsz-wght_.ttf $out/share/fonts/truetype/BodoniModaSC_opsz-wght_.ttf
     install -Dm644 BodoniModaSC-Italic_opsz-wght_.ttf $out/share/fonts/truetype/BodoniModaSC-Italic_opsz-wght_.ttf
  '';

  meta = with lib; {
    description = "Bodoni Moda SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
