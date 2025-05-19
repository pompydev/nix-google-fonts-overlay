{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jsmath-cmex10-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/jsmathcmex10/jsMath-cmex10.ttf?raw=true";
      name = "jsMath-cmex10.ttf";
      sha256 = "bb8880c3992295facd0a1f7e8019039f2e71f939b7d5a32380b711b4e2c0f259";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 jsMath-cmex10.ttf $out/share/fonts/truetype/jsMath-cmex10.ttf
  '';

  meta = with lib; {
    description = "jsMath cmex10";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
