{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-thai-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansthai/NotoSansThai%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansThai_wdth,wght_.ttf";
      sha256 = "5a1c559bb539583c8a1fd99d1c5b9491e5e14478c9cd2bd0970d5c3096cc9ef8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansThai_wdth-wght_.ttf $out/share/fonts/truetype/NotoSansThai_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Thai";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
