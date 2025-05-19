{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kavivanar-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kavivanar/Kavivanar-Regular.ttf?raw=true";
      name = "Kavivanar-Regular.ttf";
      sha256 = "ab373a218ee8464fee6ed14ee864d5a6c5146ca0458f0a61678a1889fe44b710";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kavivanar-Regular.ttf $out/share/fonts/truetype/Kavivanar-Regular.ttf
  '';

  meta = with lib; {
    description = "Kavivanar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
