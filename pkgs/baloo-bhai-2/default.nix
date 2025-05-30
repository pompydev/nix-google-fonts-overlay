{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-bhai-2-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/baloobhai2/BalooBhai2%5Bwght%5D.ttf?raw=true";
      name = "BalooBhai2_wght_.ttf";
      sha256 = "b85b68f85cb82924b1647b3eb74ebc75301aee4839eb87ee8f03d600d446b304";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BalooBhai2_wght_.ttf $out/share/fonts/truetype/BalooBhai2_wght_.ttf
  '';

  meta = with lib; {
    description = "Baloo Bhai 2";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
