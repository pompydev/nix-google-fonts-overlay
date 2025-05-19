{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-bamum-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansbamum/NotoSansBamum%5Bwght%5D.ttf?raw=true";
      name = "NotoSansBamum_wght_.ttf";
      sha256 = "ac9c498f2030192040e2c5541302ed428a81184ff4635faacd32417a58d83e53";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansBamum_wght_.ttf $out/share/fonts/truetype/NotoSansBamum_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Bamum";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
