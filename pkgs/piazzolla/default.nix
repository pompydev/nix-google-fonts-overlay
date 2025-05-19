{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "piazzolla-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/piazzolla/Piazzolla%5Bopsz,wght%5D.ttf?raw=true";
      name = "Piazzolla_opsz,wght_.ttf";
      sha256 = "b6b6451daba93a4b71f88ca8e37a66c3fd2b4e57ec54a407cddf6ae65b62c7b7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/piazzolla/Piazzolla-Italic%5Bopsz,wght%5D.ttf?raw=true";
      name = "Piazzolla-Italic_opsz,wght_.ttf";
      sha256 = "ffeb38d0c9b332f6ef685352bfbae5e65775ccdc2ae142f49ac8ed2d7d215268";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Piazzolla_opsz,wght_.ttf $out/share/fonts/truetype/Piazzolla_opsz,wght_.ttf
     install -Dm644 Piazzolla-Italic_opsz,wght_.ttf $out/share/fonts/truetype/Piazzolla-Italic_opsz,wght_.ttf
  '';

  meta = with lib; {
    description = "Piazzolla";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
