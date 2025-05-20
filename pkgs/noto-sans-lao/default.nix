{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-lao-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanslao/NotoSansLao%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansLao_wdth,wght_.ttf";
      sha256 = "9608b94603a82d09a8038946f9775242f99e3b3459b7f1e4d5b335b578cd7ab3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansLao_wdth-wght_.ttf $out/share/fonts/truetype/NotoSansLao_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Lao";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
