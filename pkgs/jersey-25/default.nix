{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jersey-25-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/jersey25/Jersey25-Regular.ttf?raw=true";
      name = "Jersey25-Regular.ttf";
      sha256 = "4d4acdd89a748e9548041a3046d95536c500e1a7be9197c6aeef7d980f79d370";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Jersey25-Regular.ttf $out/share/fonts/truetype/Jersey25-Regular.ttf
  '';

  meta = with lib; {
    description = "Jersey 25";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
