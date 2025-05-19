{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "satisfy-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/satisfy/Satisfy-Regular.ttf?raw=true";
      name = "Satisfy-Regular.ttf";
      sha256 = "55bb141a0a23a32278d5fa7fd2e853824faa173b94774660ebeddb106be07c80";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Satisfy-Regular.ttf $out/share/fonts/truetype/Satisfy-Regular.ttf
  '';

  meta = with lib; {
    description = "Satisfy";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
