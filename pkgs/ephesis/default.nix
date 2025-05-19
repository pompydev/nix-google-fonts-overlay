{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ephesis-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ephesis/Ephesis-Regular.ttf?raw=true";
      name = "Ephesis-Regular.ttf";
      sha256 = "8fb4729a918f992a37ab45f1466783c78ea8caa77a7b0e69545322e1dbe9c5f9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ephesis-Regular.ttf $out/share/fonts/truetype/Ephesis-Regular.ttf
  '';

  meta = with lib; {
    description = "Ephesis";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
