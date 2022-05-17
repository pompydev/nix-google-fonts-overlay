{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-lisu-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanslisu/NotoSansLisu[wght].ttf?raw=true";
      name = "NotoSansLisu_wght_.ttf";
      sha256 = "e218a160712d72088364c31032ec3a3612cd70bb7306034bbd550b423c417046";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansLisu_wght_.ttf $out/share/fonts/truetype/NotoSansLisu_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Lisu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
