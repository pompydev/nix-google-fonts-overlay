{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-gemstones-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rubikgemstones/RubikGemstones-Regular.ttf?raw=true";
      name = "RubikGemstones-Regular.ttf";
      sha256 = "3f308a5b3744c2727f87ffa29a1e6c8e63ad65eb5b4a36584bddec08a88468fa";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikGemstones-Regular.ttf $out/share/fonts/truetype/RubikGemstones-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Gemstones";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
