{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "spline-sans-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e58775f36e6fd3cc5f43eb64f170a9931c6b3827/ofl/splinesans/SplineSans[wght].ttf?raw=true";
      name = "SplineSans_wght_.ttf";
      sha256 = "65250939de0ab412d2b2349c9cb85304a5919fc3c5d4e74713a2d8a1f45f2947";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SplineSans_wght_.ttf $out/share/fonts/truetype/SplineSans_wght_.ttf
  '';

  meta = with lib; {
    description = "Spline Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
