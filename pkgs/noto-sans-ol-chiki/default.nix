{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-ol-chiki-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansolchiki/NotoSansOlChiki%5Bwght%5D.ttf?raw=true";
      name = "NotoSansOlChiki_wght_.ttf";
      sha256 = "e63b478019d99b1dacf995ed3416262df50a3438e8dd78d8bb1a4091b6efca6c";
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
