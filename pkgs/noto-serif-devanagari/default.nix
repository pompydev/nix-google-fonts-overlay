{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-devanagari-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifdevanagari/NotoSerifDevanagari%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSerifDevanagari_wdth,wght_.ttf";
      sha256 = "1191e07bfeb062d80e252eb85b0eafdfbda1e350707a2a60628668e8f677dbbb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifDevanagari_wdth-wght_.ttf $out/share/fonts/truetype/NotoSerifDevanagari_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Devanagari";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
