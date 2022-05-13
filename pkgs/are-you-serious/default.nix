{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "are-you-serious-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b6f5c2bd70566ca3a922c2bca6b022b5b4fba952/ofl/areyouserious/AreYouSerious-Regular.ttf?raw=true";
      name = "AreYouSerious-Regular.ttf";
      sha256 = "e2f61a166f382d7031ce750fe31d9a6d009a7dc8b63aafe4feff65e5cb4b3874";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AreYouSerious-Regular.ttf $out/share/fonts/truetype/AreYouSerious-Regular.ttf
  '';

  meta = with lib; {
    description = "Are You Serious";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
