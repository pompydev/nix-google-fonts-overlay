{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dorsa-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/dorsa/Dorsa-Regular.ttf?raw=true";
      name = "Dorsa-Regular.ttf";
      sha256 = "d204db5ceb2d028529f9701fab1bf99a7f6b1f555cda5bffe51072ec1409e3c7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Dorsa-Regular.ttf $out/share/fonts/truetype/Dorsa-Regular.ttf
  '';

  meta = with lib; {
    description = "Dorsa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
