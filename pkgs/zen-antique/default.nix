{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zen-antique-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/zenantique/ZenAntique-Regular.ttf?raw=true";
      name = "ZenAntique-Regular.ttf";
      sha256 = "8c5cf7a136837ee705d06bbc133ea18ac06b7dd284f38aace91f5de36725c315";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ZenAntique-Regular.ttf $out/share/fonts/truetype/ZenAntique-Regular.ttf
  '';

  meta = with lib; {
    description = "Zen Antique";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
