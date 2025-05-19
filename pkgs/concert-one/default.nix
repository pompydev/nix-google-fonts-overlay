{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "concert-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/concertone/ConcertOne-Regular.ttf?raw=true";
      name = "ConcertOne-Regular.ttf";
      sha256 = "54e934724b90a9c20d53b25a8d17574a7631f8461e29c8462bd7b36d49fc1e78";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ConcertOne-Regular.ttf $out/share/fonts/truetype/ConcertOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Concert One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
