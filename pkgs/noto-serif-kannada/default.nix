{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-kannada-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifkannada/NotoSerifKannada%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifKannada_wght_.ttf";
      sha256 = "3d97c98dd59251a85fcc6e95edf9be02b60147e92486927390247f1cd4d5eb37";
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
