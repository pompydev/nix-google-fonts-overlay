{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "trispace-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b85ab0fbcfc0bbf38423f56638abb9169f2d1b91/ofl/trispace/Trispace[wdth,wght].ttf?raw=true";
      name = "Trispace[wdth,wght].ttf";
      sha256 = "4021d8d7abd42907c64f0bf192446ad9f869320563f8c71a526993830e405464";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Trispace[wdth,wght].ttf' $out/share/fonts/truetype/'Trispace[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Trispace";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
