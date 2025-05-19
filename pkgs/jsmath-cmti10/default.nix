{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jsmath-cmti10-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/jsmathcmti10/jsMath-cmti10.ttf?raw=true";
      name = "jsMath-cmti10.ttf";
      sha256 = "199f93e76ad4abfc4582a3559de776be595835b04e0327fcd79b4cabaa1ebfc3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 jsMath-cmti10.ttf $out/share/fonts/truetype/jsMath-cmti10.ttf
  '';

  meta = with lib; {
    description = "jsMath cmti10";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
