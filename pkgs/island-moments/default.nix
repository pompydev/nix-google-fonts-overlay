{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "island-moments-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/islandmoments/IslandMoments-Regular.ttf?raw=true";
      name = "IslandMoments-Regular.ttf";
      sha256 = "688e4c5368b51b0d1122c4fb4c2c8f89c685f66bec489bfe07cb3287772c4b71";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IslandMoments-Regular.ttf $out/share/fonts/truetype/IslandMoments-Regular.ttf
  '';

  meta = with lib; {
    description = "Island Moments";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
