{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bahiana-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bahiana/Bahiana-Regular.ttf?raw=true";
      name = "Bahiana-Regular.ttf";
      sha256 = "75760e955339cd70012c8bd9577d373f8bdd4256a73f571f61a42f58ea26fe9c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bahiana-Regular.ttf $out/share/fonts/truetype/Bahiana-Regular.ttf
  '';

  meta = with lib; {
    description = "Bahiana";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
