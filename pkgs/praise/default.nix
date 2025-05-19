{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "praise-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/praise/Praise-Regular.ttf?raw=true";
      name = "Praise-Regular.ttf";
      sha256 = "1f9e88031638c7f3c238f5b44a9d745041b1620208a77ecbefb62b10b0ffb214";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Praise-Regular.ttf $out/share/fonts/truetype/Praise-Regular.ttf
  '';

  meta = with lib; {
    description = "Praise";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
