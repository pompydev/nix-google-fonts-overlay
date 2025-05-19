{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-sc-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifsc/NotoSerifSC%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifSC_wght_.ttf";
      sha256 = "050080d9255a86808f2945bffac582b31ef32bc36411ce29563b4961670c66f9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifSC_wght_.ttf $out/share/fonts/truetype/NotoSerifSC_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
