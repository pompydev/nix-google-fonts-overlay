{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "encode-sans-sc-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/encodesanssc/EncodeSansSC%5Bwdth,wght%5D.ttf?raw=true";
      name = "EncodeSansSC_wdth,wght_.ttf";
      sha256 = "fcad22c3440992bf42216e6a0ad6e8640d2d1dfff1ddc5573934933152123bd0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EncodeSansSC_wdth,wght_.ttf $out/share/fonts/truetype/EncodeSansSC_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Encode Sans SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
