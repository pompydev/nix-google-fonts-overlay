{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-new-tai-lue-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansnewtailue/NotoSansNewTaiLue%5Bwght%5D.ttf?raw=true";
      name = "NotoSansNewTaiLue_wght_.ttf";
      sha256 = "5362f7ab42089804beb05c936bef575f08ab27cf26109c71df99bfa28bda1cb4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansNewTaiLue_wght_.ttf $out/share/fonts/truetype/NotoSansNewTaiLue_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans New Tai Lue";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
