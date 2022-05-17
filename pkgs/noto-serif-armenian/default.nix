{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-armenian-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoserifarmenian/NotoSerifArmenian[wdth,wght].ttf?raw=true";
      name = "NotoSerifArmenian_wdth,wght_.ttf";
      sha256 = "0e6ed760f484849071fa443204f90fe8098ffde0fa13209be193940d718e600d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifArmenian_wdth,wght_.ttf $out/share/fonts/truetype/NotoSerifArmenian_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Armenian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
