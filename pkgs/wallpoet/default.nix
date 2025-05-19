{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "wallpoet-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/wallpoet/Wallpoet-Regular.ttf?raw=true";
      name = "Wallpoet-Regular.ttf";
      sha256 = "0d8dc36abe195fa455a5a9f60a29f0aa29c7404bf880a67ec71f047dabefb02b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Wallpoet-Regular.ttf $out/share/fonts/truetype/Wallpoet-Regular.ttf
  '';

  meta = with lib; {
    description = "Wallpoet";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
