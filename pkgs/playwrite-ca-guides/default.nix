{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-ca-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritecaguides/PlaywriteCAGuides-Regular.ttf?raw=true";
      name = "PlaywriteCAGuides-Regular.ttf";
      sha256 = "fba862b1543cd287dc8376539e539a9e4faef1825da54d9a1587dd61b53b6903";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteCAGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteCAGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite CA Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
