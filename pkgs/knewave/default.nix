{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "knewave-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/knewave/Knewave-Regular.ttf?raw=true";
      name = "Knewave-Regular.ttf";
      sha256 = "ed3bac761d755b89ab3082c844d4a623d63c7d6eef85d22ba1fb6c680e6a4436";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Knewave-Regular.ttf $out/share/fonts/truetype/Knewave-Regular.ttf
  '';

  meta = with lib; {
    description = "Knewave";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
