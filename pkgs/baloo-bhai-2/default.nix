{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-bhai-2-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/29d0f913700acd62ba1a10e7a5732136758cc277/ofl/baloobhai2/BalooBhai2[wght].ttf?raw=true";
      name = "BalooBhai2[wght].ttf";
      sha256 = "b85b68f85cb82924b1647b3eb74ebc75301aee4839eb87ee8f03d600d446b304";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'BalooBhai2[wght].ttf' $out/share/fonts/truetype/'BalooBhai2[wght].ttf'
  '';

  meta = with lib; {
    description = "Baloo Bhai 2";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
