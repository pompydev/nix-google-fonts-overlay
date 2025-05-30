{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pragati-narrow-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/pragatinarrow/PragatiNarrow-Regular.ttf?raw=true";
      name = "PragatiNarrow-Regular.ttf";
      sha256 = "c00d288cc79bce384e85161a256570d278bf25598f809c9718a4f59421516a94";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/pragatinarrow/PragatiNarrow-Bold.ttf?raw=true";
      name = "PragatiNarrow-Bold.ttf";
      sha256 = "8e151c9307194e6fdd69503999f2150e066dc5e9cdb2a966c861ec53286fc863";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PragatiNarrow-Regular.ttf $out/share/fonts/truetype/PragatiNarrow-Regular.ttf
     install -Dm644 PragatiNarrow-Bold.ttf $out/share/fonts/truetype/PragatiNarrow-Bold.ttf
  '';

  meta = with lib; {
    description = "Pragati Narrow";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
