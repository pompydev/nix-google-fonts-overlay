{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "smooch-sans-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fa96e5f2ec435cf11958306c9648d0d6df89e332/ofl/smoochsans/SmoochSans[wght].ttf?raw=true";
      name = "SmoochSans[wght].ttf";
      sha256 = "6d82f480d71365d9c6c4f96ad1f3cab44053ea3f0b63650b1e0e539d915aff49";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'SmoochSans[wght].ttf' $out/share/fonts/truetype/'SmoochSans[wght].ttf'
  '';

  meta = with lib; {
    description = "Smooch Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
