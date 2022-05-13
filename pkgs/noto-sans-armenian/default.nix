{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-armenian-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansarmenian/NotoSansArmenian[wdth,wght].ttf?raw=true";
      name = "NotoSansArmenian[wdth,wght].ttf";
      sha256 = "658758b9a091df5b08feac419206c74a06e18d4125b081eecf37d9ea9ad34cc0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSansArmenian[wdth,wght].ttf' $out/share/fonts/truetype/'NotoSansArmenian[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Sans Armenian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
