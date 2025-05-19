{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bigelow-rules-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bigelowrules/BigelowRules-Regular.ttf?raw=true";
      name = "BigelowRules-Regular.ttf";
      sha256 = "b6cef7ba51c1fbca920b531a39ac2c348023b5b9e4d35d1bca43ec801eeb5fcb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BigelowRules-Regular.ttf $out/share/fonts/truetype/BigelowRules-Regular.ttf
  '';

  meta = with lib; {
    description = "Bigelow Rules";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
