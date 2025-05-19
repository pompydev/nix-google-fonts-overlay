{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-ol-chiki-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansolchiki/NotoSansOlChiki%5Bwght%5D.ttf?raw=true";
      name = "NotoSansOlChiki_wght_.ttf";
      sha256 = "c9c31988656f49eccec9588825ab3b5045099c2f850ef98f356f976e8a596b4d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOlChiki_wght_.ttf $out/share/fonts/truetype/NotoSansOlChiki_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Ol Chiki";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
