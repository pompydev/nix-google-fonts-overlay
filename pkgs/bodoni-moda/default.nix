{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bodoni-moda-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bodonimoda/BodoniModa%5Bopsz,wght%5D.ttf?raw=true";
      name = "BodoniModa_opsz,wght_.ttf";
      sha256 = "550f5e34ee0a828d7941b1fe9bc58b34e5260d3f33a61532e6d0a0114e79a5cf";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bodonimoda/BodoniModa-Italic%5Bopsz,wght%5D.ttf?raw=true";
      name = "BodoniModa-Italic_opsz,wght_.ttf";
      sha256 = "dfff1619f8f6871c6372f8855b67211f9a73b4e93d45aca868cd8f46a48622de";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BodoniModa_opsz-wght_.ttf $out/share/fonts/truetype/BodoniModa_opsz-wght_.ttf
     install -Dm644 BodoniModa-Italic_opsz-wght_.ttf $out/share/fonts/truetype/BodoniModa-Italic_opsz-wght_.ttf
  '';

  meta = with lib; {
    description = "Bodoni Moda";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
