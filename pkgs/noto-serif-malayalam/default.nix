{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-malayalam-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoserifmalayalam/NotoSerifMalayalam%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifMalayalam_wght_.ttf";
      sha256 = "8cc0300245cc68fd034c54692a491add209d7a9bdd8c45d50e964edcbb194d7c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifMalayalam_wght_.ttf $out/share/fonts/truetype/NotoSerifMalayalam_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Malayalam";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
