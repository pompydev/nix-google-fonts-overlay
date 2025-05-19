{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jacquarda-bastarda-9-charted-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/jacquardabastarda9charted/JacquardaBastarda9Charted-Regular.ttf?raw=true";
      name = "JacquardaBastarda9Charted-Regular.ttf";
      sha256 = "812bb5613b16bd8cefdc43b4497400ea548c55a64f0d6e8cb1bf510a28da8581";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 JacquardaBastarda9Charted-Regular.ttf $out/share/fonts/truetype/JacquardaBastarda9Charted-Regular.ttf
  '';

  meta = with lib; {
    description = "Jacquarda Bastarda 9 Charted";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
