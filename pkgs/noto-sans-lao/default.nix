{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-lao-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanslao/NotoSansLao[wdth,wght].ttf?raw=true";
      name = "NotoSansLao_wdth,wght_.ttf";
      sha256 = "9be9702eebc9759dfab99ec1f8ddf9cd1ea94c9f78ad226d409172dbd10abb72";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansLao_wdth,wght_.ttf $out/share/fonts/truetype/NotoSansLao_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Lao";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
