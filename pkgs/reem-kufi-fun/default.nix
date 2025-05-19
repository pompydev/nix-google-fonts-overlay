{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "reem-kufi-fun-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/reemkufifun/ReemKufiFun%5Bwght%5D.ttf?raw=true";
      name = "ReemKufiFun_wght_.ttf";
      sha256 = "fdaa5e89cbf79d3198d6f19b52024a5241963e767fa7221ba83da12ae00baaeb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ReemKufiFun_wght_.ttf $out/share/fonts/truetype/ReemKufiFun_wght_.ttf
  '';

  meta = with lib; {
    description = "Reem Kufi Fun";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
