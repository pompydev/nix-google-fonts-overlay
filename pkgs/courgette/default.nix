{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "courgette-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/courgette/Courgette-Regular.ttf?raw=true";
      name = "Courgette-Regular.ttf";
      sha256 = "099739d22e66ee2b80656bba63847f9ed419ad7e3969ba2c1d3c437c0d08f3e3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Courgette-Regular.ttf $out/share/fonts/truetype/Courgette-Regular.ttf
  '';

  meta = with lib; {
    description = "Courgette";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
