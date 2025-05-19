{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kristi-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kristi/Kristi-Regular.ttf?raw=true";
      name = "Kristi-Regular.ttf";
      sha256 = "6725b7a28d9bd8761e2834a6ab380babe073678c6f42017fe576116b9d6fd2a0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kristi-Regular.ttf $out/share/fonts/truetype/Kristi-Regular.ttf
  '';

  meta = with lib; {
    description = "Kristi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
