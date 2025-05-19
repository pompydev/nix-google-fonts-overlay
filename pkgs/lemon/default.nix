{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lemon-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/lemon/Lemon-Regular.ttf?raw=true";
      name = "Lemon-Regular.ttf";
      sha256 = "6a3973a9ea7c05e6041969d0a5e8f2b04db3b2ccd5e5bc98bc7ff52c0940ce2f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Lemon-Regular.ttf $out/share/fonts/truetype/Lemon-Regular.ttf
  '';

  meta = with lib; {
    description = "Lemon";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
