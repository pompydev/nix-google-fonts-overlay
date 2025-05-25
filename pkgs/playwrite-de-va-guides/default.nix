{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-de-va-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritedevaguides/PlaywriteDEVAGuides-Regular.ttf?raw=true";
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
