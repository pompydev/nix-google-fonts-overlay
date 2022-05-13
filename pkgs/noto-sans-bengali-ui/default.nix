{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-bengali-ui-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansbengaliui/NotoSansBengaliUI[wdth,wght].ttf?raw=true";
      name = "NotoSansBengaliUI[wdth,wght].ttf";
      sha256 = "1500fd029ade204249bc276615be983f8144e45ac75812ad5fedc1a0f735240c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSansBengaliUI[wdth,wght].ttf' $out/share/fonts/truetype/'NotoSansBengaliUI[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Sans Bengali UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
