{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "shizuru-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/shizuru/Shizuru-Regular.ttf?raw=true";
      name = "Shizuru-Regular.ttf";
      sha256 = "5954562e5fbb40fffe6361cbbcac0d4a4c9c5e2897d7b20876f294fbcc243f7f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Shizuru-Regular.ttf $out/share/fonts/truetype/Shizuru-Regular.ttf
  '';

  meta = with lib; {
    description = "Shizuru";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
