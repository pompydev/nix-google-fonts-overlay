{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "butcherman-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/butcherman/Butcherman-Regular.ttf?raw=true";
      name = "Butcherman-Regular.ttf";
      sha256 = "b8cee5e2cdc71f44e6806dc0db1090a3ce2e48ca727072073700bf646b0ce6b5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Butcherman-Regular.ttf $out/share/fonts/truetype/Butcherman-Regular.ttf
  '';

  meta = with lib; {
    description = "Butcherman";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
