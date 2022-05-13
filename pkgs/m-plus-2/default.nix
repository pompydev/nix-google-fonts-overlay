{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "m-plus-2-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/96800fb3e967b900421481008771f14c3717ec52/ofl/mplus2/MPLUS2[wght].ttf?raw=true";
      name = "MPLUS2[wght].ttf";
      sha256 = "837dd9cc8ee812e541025f602362ae17d57a5942ab81bea5cc60242e8f6d3f66";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'MPLUS2[wght].ttf' $out/share/fonts/truetype/'MPLUS2[wght].ttf'
  '';

  meta = with lib; {
    description = "M PLUS 2";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
