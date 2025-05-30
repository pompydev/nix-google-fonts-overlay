{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jersey-20-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/jersey20/Jersey20-Regular.ttf?raw=true";
      name = "Jersey20-Regular.ttf";
      sha256 = "76670d7e8826860e3d2f2846b88bc1652135b8d54b6adfa5a87649b9fa4bd3b4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Jersey20-Regular.ttf $out/share/fonts/truetype/Jersey20-Regular.ttf
  '';

  meta = with lib; {
    description = "Jersey 20";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
