{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-gurmukhi-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansgurmukhi/NotoSansGurmukhi%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansGurmukhi_wdth,wght_.ttf";
      sha256 = "1e6f728fa620e566f842d81e220265813faa12771214765d289c98e035adc5f2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansGurmukhi_wdth,wght_.ttf $out/share/fonts/truetype/NotoSansGurmukhi_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Gurmukhi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
