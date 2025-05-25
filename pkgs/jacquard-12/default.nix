{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jacquard-12-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/jacquard12/Jacquard12-Regular.ttf?raw=true";
      name = "Jacquard12-Regular.ttf";
      sha256 = "b1560583565a37f3d3a25cf2572df3efd2d773ecdcbb459dcd7ea0398cb840d1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Jacquard12-Regular.ttf $out/share/fonts/truetype/Jacquard12-Regular.ttf
  '';

  meta = with lib; {
    description = "Jacquard 12";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
