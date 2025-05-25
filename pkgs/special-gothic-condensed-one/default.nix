{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "special-gothic-condensed-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/specialgothiccondensedone/SpecialGothicCondensedOne-Regular.ttf?raw=true";
      name = "SpecialGothicCondensedOne-Regular.ttf";
      sha256 = "f77948acc3218b715003475f7739d7be101fb59bd8887182866225c9de2c935f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SpecialGothicCondensedOne-Regular.ttf $out/share/fonts/truetype/SpecialGothicCondensedOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Special Gothic Condensed One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
