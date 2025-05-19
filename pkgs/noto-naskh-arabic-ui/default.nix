{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-naskh-arabic-ui-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notonaskharabicui/NotoNaskhArabicUI%5Bwght%5D.ttf?raw=true";
      name = "NotoNaskhArabicUI_wght_.ttf";
      sha256 = "6bcf69fb867a773084baf29736b6410ff7a0fd67c821271fe6eb87ed2292b1cd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoNaskhArabicUI_wght_.ttf $out/share/fonts/truetype/NotoNaskhArabicUI_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Naskh Arabic UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
