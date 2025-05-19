{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "just-another-hand-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/justanotherhand/JustAnotherHand-Regular.ttf?raw=true";
      name = "JustAnotherHand-Regular.ttf";
      sha256 = "f1cd102ebacdb6388c879c9d481d63908ee0d5939a301415a78cdfdc752f79ea";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 JustAnotherHand-Regular.ttf $out/share/fonts/truetype/JustAnotherHand-Regular.ttf
  '';

  meta = with lib; {
    description = "Just Another Hand";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
