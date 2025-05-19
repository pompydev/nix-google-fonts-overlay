{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yanone-kaffeesatz-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/yanonekaffeesatz/YanoneKaffeesatz%5Bwght%5D.ttf?raw=true";
      name = "YanoneKaffeesatz_wght_.ttf";
      sha256 = "17e3bd546d57d2c41200866ac310bd76b8c59c44cd738f6ca402a285f45e97b8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 YanoneKaffeesatz_wght_.ttf $out/share/fonts/truetype/YanoneKaffeesatz_wght_.ttf
  '';

  meta = with lib; {
    description = "Yanone Kaffeesatz";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
