{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mandali-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mandali/Mandali-Regular.ttf?raw=true";
      name = "Mandali-Regular.ttf";
      sha256 = "8ba4663d114aff639e4974b65795353c193272026308608d95770aaaa6afd806";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Mandali-Regular.ttf $out/share/fonts/truetype/Mandali-Regular.ttf
  '';

  meta = with lib; {
    description = "Mandali";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
