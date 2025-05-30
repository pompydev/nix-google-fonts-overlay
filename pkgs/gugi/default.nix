{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gugi-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/gugi/Gugi-Regular.ttf?raw=true";
      name = "Gugi-Regular.ttf";
      sha256 = "c0b1f979979cfc309fb2438fa9464f96173353e0c4842cc7a5919658184ed9d3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gugi-Regular.ttf $out/share/fonts/truetype/Gugi-Regular.ttf
  '';

  meta = with lib; {
    description = "Gugi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
