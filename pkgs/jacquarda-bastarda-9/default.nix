{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jacquarda-bastarda-9-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/jacquardabastarda9/JacquardaBastarda9-Regular.ttf?raw=true";
      name = "JacquardaBastarda9-Regular.ttf";
      sha256 = "7d8e5c30bd58598913fc5fd297bc875d1fab1c05fc407c2dfc406a0be9c5a22c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 JacquardaBastarda9-Regular.ttf $out/share/fonts/truetype/JacquardaBastarda9-Regular.ttf
  '';

  meta = with lib; {
    description = "Jacquarda Bastarda 9";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
