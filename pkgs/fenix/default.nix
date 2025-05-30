{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fenix-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/fenix/Fenix-Regular.ttf?raw=true";
      name = "Fenix-Regular.ttf";
      sha256 = "5104f5f344f64b5532850b131d7b9e033c112fcfa97dfef00a64c0a40bdae911";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Fenix-Regular.ttf $out/share/fonts/truetype/Fenix-Regular.ttf
  '';

  meta = with lib; {
    description = "Fenix";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
