{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nova-round-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/novaround/NovaRound.ttf?raw=true";
      name = "NovaRound.ttf";
      sha256 = "9f427a08e6367f847d4b9452ab56252d99436b6a567206c1734d5cb4de895d95";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NovaRound.ttf $out/share/fonts/truetype/NovaRound.ttf
  '';

  meta = with lib; {
    description = "Nova Round";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
