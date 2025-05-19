{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "assistant-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/assistant/Assistant%5Bwght%5D.ttf?raw=true";
      name = "Assistant_wght_.ttf";
      sha256 = "1c3b393884f8fb133a1b17f41d26178adae1050a4f86d7a429d1b5658c314fa3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Assistant_wght_.ttf $out/share/fonts/truetype/Assistant_wght_.ttf
  '';

  meta = with lib; {
    description = "Assistant";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
