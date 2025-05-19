{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-gurmukhi-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifgurmukhi/NotoSerifGurmukhi%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifGurmukhi_wght_.ttf";
      sha256 = "0d15ba8362035a032156c0516038cb8ed93507f7a7762df3e65eaad9218d764b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifGurmukhi_wght_.ttf $out/share/fonts/truetype/NotoSerifGurmukhi_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Gurmukhi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
