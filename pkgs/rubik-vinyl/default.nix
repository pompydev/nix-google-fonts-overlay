{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-vinyl-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rubikvinyl/RubikVinyl-Regular.ttf?raw=true";
      name = "RubikVinyl-Regular.ttf";
      sha256 = "64f1d1636851d814a9031a945bc6ca6b7bc26a29009eb316176d27f00f2b7d4e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikVinyl-Regular.ttf $out/share/fonts/truetype/RubikVinyl-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Vinyl";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
