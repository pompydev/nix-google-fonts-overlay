{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "monoton-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/monoton/Monoton-Regular.ttf?raw=true";
      name = "Monoton-Regular.ttf";
      sha256 = "951c4cea65ffede784a7c9672feec5d329a7e1e12216c42d53ecf36c90d04dea";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Monoton-Regular.ttf $out/share/fonts/truetype/Monoton-Regular.ttf
  '';

  meta = with lib; {
    description = "Monoton";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
