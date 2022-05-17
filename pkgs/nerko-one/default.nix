{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nerko-one-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0372d9c8cf912f903965ed2750929c3c47eb1c8f/ofl/nerkoone/NerkoOne-Regular.ttf?raw=true";
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
