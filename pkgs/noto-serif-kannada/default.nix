{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-kannada-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoserifkannada/NotoSerifKannada%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifKannada_wght_.ttf";
      sha256 = "8ccf2c7b4e89ba4c7c7e57e9d54d2e052835e2d2e3a51f254342894d649126a8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifKannada_wght_.ttf $out/share/fonts/truetype/NotoSerifKannada_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Kannada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
