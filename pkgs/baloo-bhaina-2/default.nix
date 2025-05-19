{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-bhaina-2-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/baloobhaina2/BalooBhaina2%5Bwght%5D.ttf?raw=true";
      name = "BalooBhaina2_wght_.ttf";
      sha256 = "d22904b7337723201c910edf70be2de6136ec65be366f2b0e6489860f1343f04";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BalooBhaina2_wght_.ttf $out/share/fonts/truetype/BalooBhaina2_wght_.ttf
  '';

  meta = with lib; {
    description = "Baloo Bhaina 2";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
