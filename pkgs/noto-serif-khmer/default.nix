{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-khmer-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifkhmer/NotoSerifKhmer%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSerifKhmer_wdth,wght_.ttf";
      sha256 = "50ad032042491e98b440e41490d26b716d8d43886eebfafa9735f6284c1980e2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifKhmer_wdth-wght_.ttf $out/share/fonts/truetype/NotoSerifKhmer_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Khmer";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
