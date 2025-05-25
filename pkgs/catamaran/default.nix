{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "catamaran-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/catamaran/Catamaran%5Bwght%5D.ttf?raw=true";
      name = "Catamaran_wght_.ttf";
      sha256 = "f6ee331c381f441454225196d7930d4d0a31554d7f1f9c8c58149ca9e122b294";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Catamaran_wght_.ttf $out/share/fonts/truetype/Catamaran_wght_.ttf
  '';

  meta = with lib; {
    description = "Catamaran";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
