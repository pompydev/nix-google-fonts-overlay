{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "miniver-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/miniver/Miniver-Regular.ttf?raw=true";
      name = "Miniver-Regular.ttf";
      sha256 = "0637ff653a9113189d196434f2055388638083dde397964b83aa2c1800d5b5b7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Miniver-Regular.ttf $out/share/fonts/truetype/Miniver-Regular.ttf
  '';

  meta = with lib; {
    description = "Miniver";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
