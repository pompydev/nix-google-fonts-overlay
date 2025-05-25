{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "agu-display-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/agudisplay/AguDisplay%5BMORF%5D.ttf?raw=true";
      name = "AguDisplay_MORF_.ttf";
      sha256 = "27ed259a81a476a354abc4cf5b31717241a57db1e6bce24453729214930c96ee";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AguDisplay_MORF_.ttf $out/share/fonts/truetype/AguDisplay_MORF_.ttf
  '';

  meta = with lib; {
    description = "Agu Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
