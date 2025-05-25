{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-no-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwriteno/PlaywriteNO%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteNO_wght_.ttf";
      sha256 = "f4c860ca1f83d5d86db52eda1d01e81e2b41f119123189247f7d3071dd60bced";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteNO_wght_.ttf $out/share/fonts/truetype/PlaywriteNO_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite NO";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
