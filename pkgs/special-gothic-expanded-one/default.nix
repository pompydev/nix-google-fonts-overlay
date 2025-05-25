{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "special-gothic-expanded-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/specialgothicexpandedone/SpecialGothicExpandedOne-Regular.ttf?raw=true";
      name = "SpecialGothicExpandedOne-Regular.ttf";
      sha256 = "b6c347c00c607f9ca562e6054cadf87fb3ea20dbe2cc482bad3086fa4de48027";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SpecialGothicExpandedOne-Regular.ttf $out/share/fonts/truetype/SpecialGothicExpandedOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Special Gothic Expanded One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
