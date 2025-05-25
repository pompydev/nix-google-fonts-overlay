{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "caveat-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/caveat/Caveat%5Bwght%5D.ttf?raw=true";
      name = "Caveat_wght_.ttf";
      sha256 = "0bdb6b660482d31531b3945849fba5916b3ef8695da7024a9e6b9ee3c4157988";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Caveat_wght_.ttf $out/share/fonts/truetype/Caveat_wght_.ttf
  '';

  meta = with lib; {
    description = "Caveat";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
