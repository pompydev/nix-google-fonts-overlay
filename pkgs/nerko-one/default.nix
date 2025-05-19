{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nerko-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/nerkoone/NerkoOne-Regular.ttf?raw=true";
      name = "NerkoOne-Regular.ttf";
      sha256 = "55695d7d77712b983973e2984d8014c5060aecfb2e94493671fa4f0ffc3876c7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NerkoOne-Regular.ttf $out/share/fonts/truetype/NerkoOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Nerko One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
