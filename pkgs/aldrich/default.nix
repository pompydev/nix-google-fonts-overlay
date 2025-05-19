{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "aldrich-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/aldrich/Aldrich-Regular.ttf?raw=true";
      name = "Aldrich-Regular.ttf";
      sha256 = "bcabd8e6db3e8cb59242e8dbdef30bfd9b25be600e2e8f506618008f99138d47";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Aldrich-Regular.ttf $out/share/fonts/truetype/Aldrich-Regular.ttf
  '';

  meta = with lib; {
    description = "Aldrich";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
