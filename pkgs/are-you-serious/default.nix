{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "are-you-serious-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/areyouserious/AreYouSerious-Regular.ttf?raw=true";
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
