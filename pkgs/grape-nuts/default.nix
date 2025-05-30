{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "grape-nuts-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/grapenuts/GrapeNuts-Regular.ttf?raw=true";
      name = "GrapeNuts-Regular.ttf";
      sha256 = "d4772724931dbafc507c610f10d8cffa4602f8b8e8abfc0bd384996875af4134";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GrapeNuts-Regular.ttf $out/share/fonts/truetype/GrapeNuts-Regular.ttf
  '';

  meta = with lib; {
    description = "Grape Nuts";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
