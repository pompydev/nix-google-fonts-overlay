{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bakbak-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bakbakone/BakbakOne-Regular.ttf?raw=true";
      name = "BakbakOne-Regular.ttf";
      sha256 = "238dd2cf76f0fa33e02ea67c2f9697731378ad567503ca6b1f778778093ff84f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BakbakOne-Regular.ttf $out/share/fonts/truetype/BakbakOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Bakbak One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
