{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "42dot-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/42dotsans/42dotSans%5Bwght%5D.ttf?raw=true";
      name = "42dotSans_wght_.ttf";
      sha256 = "cf9ec2f79b6d13384eef338477a223800a547fbb21665eb0ea1330a513805b6a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 42dotSans_wght_.ttf $out/share/fonts/truetype/42dotSans_wght_.ttf
  '';

  meta = with lib; {
    description = "42dot Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
