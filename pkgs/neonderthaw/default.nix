{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "neonderthaw-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ab89534e05283b490c85a5ae471a1a547bfbae3e/ofl/neonderthaw/Neonderthaw-Regular.ttf?raw=true";
      name = "Neonderthaw-Regular.ttf";
      sha256 = "15a72ab630eb73ee922ad653783b81053cf381ef53bcc17a536f3c7fa8097184";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Neonderthaw-Regular.ttf $out/share/fonts/truetype/Neonderthaw-Regular.ttf
  '';

  meta = with lib; {
    description = "Neonderthaw";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
