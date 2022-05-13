{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ballet-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/03fc129d8f320c5cbfbaed842c7325efb9ca9c59/ofl/ballet/Ballet[opsz].ttf?raw=true";
      name = "Ballet[opsz].ttf";
      sha256 = "6500b6abb6dd31c3389e8f32a21ae3c66e3257d0afefecf7688aa23f742cb677";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Ballet[opsz].ttf' $out/share/fonts/truetype/'Ballet[opsz].ttf'
  '';

  meta = with lib; {
    description = "Ballet";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
