{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "amarante-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/amarante/Amarante-Regular.ttf?raw=true";
      name = "Amarante-Regular.ttf";
      sha256 = "de5eb7cc2b13632fe3f9fedbe4dc34571a76758cfb52b71fdace8fc4a7638a2f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Amarante-Regular.ttf $out/share/fonts/truetype/Amarante-Regular.ttf
  '';

  meta = with lib; {
    description = "Amarante";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
