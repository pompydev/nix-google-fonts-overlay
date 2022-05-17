{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "karla-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/568985dba2cc5bf58d9f59af93fd5a5faea610ff/ofl/karla/Karla%5Bwght%5D.ttf?raw=true";
      name = "Karla_wght_.ttf";
      sha256 = "3acf8df2fcd53113f9a685eaf457e6c5fcc39caaa8ed7628c9e6519bfc6fb292";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/568985dba2cc5bf58d9f59af93fd5a5faea610ff/ofl/karla/Karla-Italic%5Bwght%5D.ttf?raw=true";
      name = "Karla-Italic_wght_.ttf";
      sha256 = "ec239d29a374c435e2d4d0b4f835683f8c733b4320edceb953be3548129929db";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Karla_wght_.ttf $out/share/fonts/truetype/Karla_wght_.ttf
     install -Dm644 Karla-Italic_wght_.ttf $out/share/fonts/truetype/Karla-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Karla";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
