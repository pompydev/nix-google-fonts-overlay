{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-de-va-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritedevaguides/PlaywriteDEVAGuides-Regular.ttf?raw=true";
      name = "PlaywriteDEVAGuides-Regular.ttf";
      sha256 = "863ae1ed69e58f9fdd25a21efaf219b01a82ab1417b817664311bf4f5a1ca9cf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteDEVAGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteDEVAGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite DE VA Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
