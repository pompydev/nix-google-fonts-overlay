{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "grenze-gotisch-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/98931f43a8dcf8ca908949780e0d03a6e4195227/ofl/grenzegotisch/GrenzeGotisch[wght].ttf?raw=true";
      name = "GrenzeGotisch[wght].ttf";
      sha256 = "701b299d8dc002a2b4bea2ff0f1272c0e4081a2835914354804565c410d0c637";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'GrenzeGotisch[wght].ttf' $out/share/fonts/truetype/'GrenzeGotisch[wght].ttf'
  '';

  meta = with lib; {
    description = "Grenze Gotisch";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
