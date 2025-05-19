{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "orelega-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/orelegaone/OrelegaOne-Regular.ttf?raw=true";
      name = "OrelegaOne-Regular.ttf";
      sha256 = "df8372dca68d1a5bc4c7713594ec275d14192f2260b9d5c67c426d300505b704";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 OrelegaOne-Regular.ttf $out/share/fonts/truetype/OrelegaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Orelega One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
