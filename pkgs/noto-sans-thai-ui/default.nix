{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-thai-ui-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansthaiui/NotoSansThaiUI%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansThaiUI_wdth,wght_.ttf";
      sha256 = "3eddf0ec5225225b9cfd9e649314b883d209cedbc593ff96e485557296353389";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansThaiUI_wdth,wght_.ttf $out/share/fonts/truetype/NotoSansThaiUI_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Thai UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
