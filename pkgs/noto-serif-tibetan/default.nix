{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-tibetan-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoseriftibetan/NotoSerifTibetan%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifTibetan_wght_.ttf";
      sha256 = "060ec022b04c306de3f58d051fb0e1cf81a5b610c5910fbfc43bba154c057cda";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifTibetan_wght_.ttf $out/share/fonts/truetype/NotoSerifTibetan_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Tibetan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
