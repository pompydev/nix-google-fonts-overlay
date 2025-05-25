{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kavivanar-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/kavivanar/Kavivanar-Regular.ttf?raw=true";
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
