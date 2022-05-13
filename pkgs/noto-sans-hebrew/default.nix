{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-hebrew-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanshebrew/NotoSansHebrew[wdth,wght].ttf?raw=true";
      name = "NotoSansHebrew[wdth,wght].ttf";
      sha256 = "9e4eb7bb57f2b932db1af78f9ad142114614b0e226f2e18b05327c1fde04c86d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSansHebrew[wdth,wght].ttf' $out/share/fonts/truetype/'NotoSansHebrew[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Sans Hebrew";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
