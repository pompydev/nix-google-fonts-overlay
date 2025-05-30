{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pathway-gothic-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/pathwaygothicone/PathwayGothicOne-Regular.ttf?raw=true";
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
