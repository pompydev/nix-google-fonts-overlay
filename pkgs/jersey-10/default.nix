{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jersey-10-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/jersey10/Jersey10-Regular.ttf?raw=true";
      name = "Jersey10-Regular.ttf";
      sha256 = "db9cbd091617048a145d249daa2b815fe7083be6ab66ac26626e21a4e01c3e82";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Jersey10-Regular.ttf $out/share/fonts/truetype/Jersey10-Regular.ttf
  '';

  meta = with lib; {
    description = "Jersey 10";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
