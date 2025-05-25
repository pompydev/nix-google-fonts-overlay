{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tilt-warp-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/tiltwarp/TiltWarp%5BXROT,YROT%5D.ttf?raw=true";
      name = "TiltWarp_XROT,YROT_.ttf";
      sha256 = "e650320e405c220853184fa20a60a812f3f0275c3a1b2d1769409ad1cb4bfca5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TiltWarp_XROT-YROT_.ttf $out/share/fonts/truetype/TiltWarp_XROT-YROT_.ttf
  '';

  meta = with lib; {
    description = "Tilt Warp";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
