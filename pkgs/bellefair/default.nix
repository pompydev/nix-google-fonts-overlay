{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bellefair-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bellefair/Bellefair-Regular.ttf?raw=true";
      name = "Bellefair-Regular.ttf";
      sha256 = "5c0cd4d526e6dfcb189106af6b5e6ec99a54efb6d458dfd61626ce6dc0f03026";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bellefair-Regular.ttf $out/share/fonts/truetype/Bellefair-Regular.ttf
  '';

  meta = with lib; {
    description = "Bellefair";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
