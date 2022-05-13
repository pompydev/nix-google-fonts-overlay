{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "manrope-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8f9a401dbb3793e0d1264b15d96aa253f05280f5/ofl/manrope/Manrope[wght].ttf?raw=true";
      name = "Manrope[wght].ttf";
      sha256 = "d0639be45d0af36e798172419d7bd173c4bd4f29e2b76cbb69db1d11bf8b0a40";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Manrope[wght].ttf' $out/share/fonts/truetype/'Manrope[wght].ttf'
  '';

  meta = with lib; {
    description = "Manrope";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
