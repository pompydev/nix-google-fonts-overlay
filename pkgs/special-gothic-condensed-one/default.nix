{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "special-gothic-condensed-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/specialgothiccondensedone/SpecialGothicCondensedOne-Regular.ttf?raw=true";
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
