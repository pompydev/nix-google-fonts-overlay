{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-au-tas-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwriteautas/PlaywriteAUTAS%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteAUTAS_wght_.ttf";
      sha256 = "b90944bb8b299f46587f0d6860e03bb4edf47d12255b50f76dd0938849036299";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteAUTAS_wght_.ttf $out/share/fonts/truetype/PlaywriteAUTAS_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite AU TAS";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
