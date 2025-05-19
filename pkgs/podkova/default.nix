{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "podkova-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/podkova/Podkova%5Bwght%5D.ttf?raw=true";
      name = "Podkova_wght_.ttf";
      sha256 = "a7be6732a489b1c5c7c37a5c2e816fad901563ccd882e9bbc56d13eeebf4a4e7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Podkova_wght_.ttf $out/share/fonts/truetype/Podkova_wght_.ttf
  '';

  meta = with lib; {
    description = "Podkova";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
