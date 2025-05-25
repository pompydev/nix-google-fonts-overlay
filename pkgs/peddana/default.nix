{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "peddana-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/peddana/Peddana-Regular.ttf?raw=true";
      name = "Peddana-Regular.ttf";
      sha256 = "1aca2e50d3a8dd43250bf942049ae18b8fda542f0469434eb35c8a53b1157836";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Peddana-Regular.ttf $out/share/fonts/truetype/Peddana-Regular.ttf
  '';

  meta = with lib; {
    description = "Peddana";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
