{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-ethiopic-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoserifethiopic/NotoSerifEthiopic[wdth,wght].ttf?raw=true";
      name = "NotoSerifEthiopic[wdth,wght].ttf";
      sha256 = "27c5d1a628216c03bfb69aa62180f3fa67db92e0a91fd99ab3d731ae8015e813";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSerifEthiopic[wdth,wght].ttf' $out/share/fonts/truetype/'NotoSerifEthiopic[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Serif Ethiopic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
