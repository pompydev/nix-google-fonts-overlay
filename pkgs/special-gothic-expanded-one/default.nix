{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "special-gothic-expanded-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/specialgothicexpandedone/SpecialGothicExpandedOne-Regular.ttf?raw=true";
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
