{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-bhaina-2-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/35975c1b333741fd295e1137b10e4ce351358574/ofl/baloobhaina2/BalooBhaina2%5Bwght%5D.ttf?raw=true";
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
