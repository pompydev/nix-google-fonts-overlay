{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jsmath-cmr10-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/jsmathcmr10/jsMath-cmr10.ttf?raw=true";
      name = "jsMath-cmr10.ttf";
      sha256 = "9bd5bae936a4af7152f320e3fee7f14ebbb778101903e9c8b2cc8901f40b778b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 jsMath-cmr10.ttf $out/share/fonts/truetype/jsMath-cmr10.ttf
  '';

  meta = with lib; {
    description = "jsMath cmr10";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
