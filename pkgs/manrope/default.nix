{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "manrope-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8f9a401dbb3793e0d1264b15d96aa253f05280f5/ofl/manrope/Manrope%5Bwght%5D.ttf?raw=true";
      name = "Manrope_wght_.ttf";
      sha256 = "d0639be45d0af36e798172419d7bd173c4bd4f29e2b76cbb69db1d11bf8b0a40";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Manrope_wght_.ttf $out/share/fonts/truetype/Manrope_wght_.ttf
  '';

  meta = with lib; {
    description = "Manrope";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
