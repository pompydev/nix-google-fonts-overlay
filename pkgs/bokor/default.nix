{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bokor-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5dbdb58c9075640112a760b0f2376ab04cd187/ofl/bokor/Bokor-Regular.ttf?raw=true";
      name = "Bokor-Regular.ttf";
      sha256 = "640d475abdd109bfd80d2eef892fe1c63d3ec0faddcd15f819c5f1729712c370";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bokor-Regular.ttf $out/share/fonts/truetype/Bokor-Regular.ttf
  '';

  meta = with lib; {
    description = "Bokor";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
