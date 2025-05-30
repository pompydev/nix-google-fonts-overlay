{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-fr-moderne-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritefrmoderne/PlaywriteFRModerne%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteFRModerne_wght_.ttf";
      sha256 = "8ac2813db7de12935b95e7127c85a92e694b03083be379db7ceb3ac202b0d500";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteFRModerne_wght_.ttf $out/share/fonts/truetype/PlaywriteFRModerne_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite FR Moderne";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
