{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "trispace-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b85ab0fbcfc0bbf38423f56638abb9169f2d1b91/ofl/trispace/Trispace%5Bwdth,wght%5D.ttf?raw=true";
      name = "Trispace_wdth,wght_.ttf";
      sha256 = "4021d8d7abd42907c64f0bf192446ad9f869320563f8c71a526993830e405464";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Trispace_wdth,wght_.ttf $out/share/fonts/truetype/Trispace_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Trispace";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
