{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-nz-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritenz/PlaywriteNZ%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteNZ_wght_.ttf";
      sha256 = "2fe05597c1d04f734bbbdd91ca6846767512939ca254c0ea81fb48bfd9b47a30";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteNZ_wght_.ttf $out/share/fonts/truetype/PlaywriteNZ_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite NZ";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
