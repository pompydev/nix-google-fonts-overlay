{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-marker-hatch-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/rubikmarkerhatch/RubikMarkerHatch-Regular.ttf?raw=true";
      name = "RubikMarkerHatch-Regular.ttf";
      sha256 = "8d91e401dfaf5c93b26fc717b27c262c829be6804f7be7a6db7a20f4ff09c09b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikMarkerHatch-Regular.ttf $out/share/fonts/truetype/RubikMarkerHatch-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Marker Hatch";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
