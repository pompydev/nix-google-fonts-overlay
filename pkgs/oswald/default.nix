{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "oswald-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/oswald/Oswald%5Bwght%5D.ttf?raw=true";
      name = "Oswald_wght_.ttf";
      sha256 = "5b38c246e255a12f5712d640d56bcced0472466fc68983d2d0410ec0457c2817";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Oswald_wght_.ttf $out/share/fonts/truetype/Oswald_wght_.ttf
  '';

  meta = with lib; {
    description = "Oswald";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
