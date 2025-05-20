{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-gurmukhi-ui-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansgurmukhiui/NotoSansGurmukhiUI%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansGurmukhiUI_wdth,wght_.ttf";
      sha256 = "3615afc43386f768ac15335349e8bf810bb811614f6b42252eca1fc34849692b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansGurmukhiUI_wdth-wght_.ttf $out/share/fonts/truetype/NotoSansGurmukhiUI_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Gurmukhi UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
