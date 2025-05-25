{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "glory-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/glory/Glory%5Bwght%5D.ttf?raw=true";
      name = "Glory_wght_.ttf";
      sha256 = "7282178080ca4fc5feca7b6ff96212acee58462efdff8a43b80d67204f100837";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/glory/Glory-Italic%5Bwght%5D.ttf?raw=true";
      name = "Glory-Italic_wght_.ttf";
      sha256 = "f24daaa4671778f0788535471fe9aa6a0a09ecb97ee644d9a7b5801de9f6cb94";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Glory_wght_.ttf $out/share/fonts/truetype/Glory_wght_.ttf
     install -Dm644 Glory-Italic_wght_.ttf $out/share/fonts/truetype/Glory-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Glory";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
