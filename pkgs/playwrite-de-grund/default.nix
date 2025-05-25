{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-de-grund-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritedegrund/PlaywriteDEGrund%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteDEGrund_wght_.ttf";
      sha256 = "47cc063ac4253f46e7e63eec0909004526db4eb863dce601e8632e4a37a72c86";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteDEGrund_wght_.ttf $out/share/fonts/truetype/PlaywriteDEGrund_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite DE Grund";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
