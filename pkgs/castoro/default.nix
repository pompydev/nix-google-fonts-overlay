{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "castoro-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ebaa6a7aab9b700da4e30a4682687acdf427eae7/ofl/castoro/Castoro-Regular.ttf?raw=true";
      name = "Castoro-Regular.ttf";
      sha256 = "ae07a1fa2495438bfdeff1f3013c10972ef06ee45ee50444756cf66f1c6117ab";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ebaa6a7aab9b700da4e30a4682687acdf427eae7/ofl/castoro/Castoro-Italic.ttf?raw=true";
      name = "Castoro-Italic.ttf";
      sha256 = "868b5a6f1a24a162e65999361fd1dd6ff82bf14b0e603a2a724e5a72a4229624";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Castoro-Regular.ttf $out/share/fonts/truetype/Castoro-Regular.ttf
     install -Dm644 Castoro-Italic.ttf $out/share/fonts/truetype/Castoro-Italic.ttf
  '';

  meta = with lib; {
    description = "Castoro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
