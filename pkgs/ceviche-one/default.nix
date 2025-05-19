{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ceviche-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/cevicheone/CevicheOne-Regular.ttf?raw=true";
      name = "CevicheOne-Regular.ttf";
      sha256 = "366249c911e689cd5ea3d576c0eba0c37a938e0a58721fce3733a4244dd9ab32";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CevicheOne-Regular.ttf $out/share/fonts/truetype/CevicheOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Ceviche One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
