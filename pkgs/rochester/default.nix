{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rochester-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/rochester/Rochester-Regular.ttf?raw=true";
      name = "Rochester-Regular.ttf";
      sha256 = "38657df5e357e841a39995592970ac14ea96a1376f178f0d8e0231fd5d630b2b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rochester-Regular.ttf $out/share/fonts/truetype/Rochester-Regular.ttf
  '';

  meta = with lib; {
    description = "Rochester";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
