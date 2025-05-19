{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-thaana-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansthaana/NotoSansThaana%5Bwght%5D.ttf?raw=true";
      name = "NotoSansThaana_wght_.ttf";
      sha256 = "a296795c892a9ec2b0f4d3af315568506ef9fd55920386170992d3935d8866ca";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansThaana_wght_.ttf $out/share/fonts/truetype/NotoSansThaana_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Thaana";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
