{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rancho-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/rancho/Rancho-Regular.ttf?raw=true";
      name = "Rancho-Regular.ttf";
      sha256 = "1add7ee1a98ace8d687935b2a1735e1c53efc8a2108b73c8828db2df8a231306";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rancho-Regular.ttf $out/share/fonts/truetype/Rancho-Regular.ttf
  '';

  meta = with lib; {
    description = "Rancho";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
