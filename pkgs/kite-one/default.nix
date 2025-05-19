{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kite-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kiteone/KiteOne-Regular.ttf?raw=true";
      name = "KiteOne-Regular.ttf";
      sha256 = "f482673f99d08cf01d617e871cc49f529ae479c321e1ec7f009419275a2f7b61";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KiteOne-Regular.ttf $out/share/fonts/truetype/KiteOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Kite One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
