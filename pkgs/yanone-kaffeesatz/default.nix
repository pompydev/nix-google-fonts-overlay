{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yanone-kaffeesatz-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/yanonekaffeesatz/YanoneKaffeesatz%5Bwght%5D.ttf?raw=true";
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
