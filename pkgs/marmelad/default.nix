{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "marmelad-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/marmelad/Marmelad-Regular.ttf?raw=true";
      name = "Marmelad-Regular.ttf";
      sha256 = "aadcea7a972d84294ab5399b99654506559d328e03169a2351854c7046b77fc6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Marmelad-Regular.ttf $out/share/fonts/truetype/Marmelad-Regular.ttf
  '';

  meta = with lib; {
    description = "Marmelad";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
