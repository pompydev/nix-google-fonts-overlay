{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "galindo-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/galindo/Galindo-Regular.ttf?raw=true";
      name = "Galindo-Regular.ttf";
      sha256 = "335a73def6a890d38e8793a81077a8e15987b1a4e5366847e138b5beb13bf0fe";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Galindo-Regular.ttf $out/share/fonts/truetype/Galindo-Regular.ttf
  '';

  meta = with lib; {
    description = "Galindo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
