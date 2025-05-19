{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pathway-gothic-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/pathwaygothicone/PathwayGothicOne-Regular.ttf?raw=true";
      name = "PathwayGothicOne-Regular.ttf";
      sha256 = "0b2785c0bbd9c67667875d8d48eeeef9751bb814038747ba00f693b888dbbdf7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PathwayGothicOne-Regular.ttf $out/share/fonts/truetype/PathwayGothicOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Pathway Gothic One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
