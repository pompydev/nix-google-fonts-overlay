{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-georgian-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoserifgeorgian/NotoSerifGeorgian[wdth,wght].ttf?raw=true";
      name = "NotoSerifGeorgian[wdth,wght].ttf";
      sha256 = "f5cf90453b19f33fb1a128238cc1a559d888cc17f59f603626619b2535b85222";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSerifGeorgian[wdth,wght].ttf' $out/share/fonts/truetype/'NotoSerifGeorgian[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Serif Georgian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
