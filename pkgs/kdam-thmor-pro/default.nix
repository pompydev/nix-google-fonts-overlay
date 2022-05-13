{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kdam-thmor-pro-${version}";
  version = "2022-05-11-145120";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c1a3aacf48aedd9bdbe9dd8813365d118c8f8fda/ofl/kdamthmorpro/KdamThmorPro-Regular.ttf?raw=true";
      name = "KdamThmorPro-Regular.ttf";
      sha256 = "f3c0eb232ec1ca8991576cd93eb604868830dc201bf71f31fb7fba8cf4441226";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KdamThmorPro-Regular.ttf $out/share/fonts/truetype/KdamThmorPro-Regular.ttf
  '';

  meta = with lib; {
    description = "Kdam Thmor Pro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
