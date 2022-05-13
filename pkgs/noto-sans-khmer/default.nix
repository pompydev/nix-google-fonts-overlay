{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-khmer-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanskhmer/NotoSansKhmer[wdth,wght].ttf?raw=true";
      name = "NotoSansKhmer[wdth,wght].ttf";
      sha256 = "0afeb6dddc4e0557c11c56db4e18ba9ba954d83eaaf9c1c1cc346695742ac5cf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSansKhmer[wdth,wght].ttf' $out/share/fonts/truetype/'NotoSansKhmer[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Sans Khmer";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
