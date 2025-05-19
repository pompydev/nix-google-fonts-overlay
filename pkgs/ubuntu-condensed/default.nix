{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ubuntu-condensed-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ufl/ubuntucondensed/UbuntuCondensed-Regular.ttf?raw=true";
      name = "UbuntuCondensed-Regular.ttf";
      sha256 = "6c1f68d2e85832feae9ea30d2a6c0ea71ea623e8ea342bf00a414f6493ccf720";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 UbuntuCondensed-Regular.ttf $out/share/fonts/truetype/UbuntuCondensed-Regular.ttf
  '';

  meta = with lib; {
    description = "Ubuntu Condensed";
    license = licenses.ufl;
    platforms = platforms.all;
  };
}
