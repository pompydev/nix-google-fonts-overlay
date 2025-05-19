{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hahmlet-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/hahmlet/Hahmlet%5Bwght%5D.ttf?raw=true";
      name = "Hahmlet_wght_.ttf";
      sha256 = "892bffe530255770a7435226154a02f519055ff6bedf64254f37f21d15a59279";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Hahmlet_wght_.ttf $out/share/fonts/truetype/Hahmlet_wght_.ttf
  '';

  meta = with lib; {
    description = "Hahmlet";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
