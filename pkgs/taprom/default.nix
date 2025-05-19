{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "taprom-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/taprom/Taprom-Regular.ttf?raw=true";
      name = "Taprom-Regular.ttf";
      sha256 = "d89c52e9ad32693ffbd8646e2770e331d83c310056badf32ce3b12b3e1b5b45a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Taprom-Regular.ttf $out/share/fonts/truetype/Taprom-Regular.ttf
  '';

  meta = with lib; {
    description = "Taprom";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
