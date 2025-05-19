{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "indie-flower-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/indieflower/IndieFlower-Regular.ttf?raw=true";
      name = "IndieFlower-Regular.ttf";
      sha256 = "ccc94b22b156e9c5dfe50fd051f01b097600b252c24473e624bb43a143140a94";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IndieFlower-Regular.ttf $out/share/fonts/truetype/IndieFlower-Regular.ttf
  '';

  meta = with lib; {
    description = "Indie Flower";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
