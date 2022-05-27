{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hina-mincho-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0bac7827e144dbedf41b2ae9cb798d1b19f180ba/ofl/hinamincho/HinaMincho-Regular.ttf?raw=true";
      name = "HinaMincho-Regular.ttf";
      sha256 = "8395fafa0c2721b4b5c274031e1336fea0f703d908b175ee21f8ba2f1ad566a0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HinaMincho-Regular.ttf $out/share/fonts/truetype/HinaMincho-Regular.ttf
  '';

  meta = with lib; {
    description = "Hina Mincho";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
