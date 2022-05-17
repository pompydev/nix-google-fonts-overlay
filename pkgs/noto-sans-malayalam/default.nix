{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-malayalam-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmalayalam/NotoSansMalayalam%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansMalayalam_wdth,wght_.ttf";
      sha256 = "aca1868cf11b3854da6b5e87ccc1a13c3273992d337f2735414fa3916c75ec0f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMalayalam_wdth,wght_.ttf $out/share/fonts/truetype/NotoSansMalayalam_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Malayalam";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
