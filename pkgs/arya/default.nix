{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "arya-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/arya/Arya-Regular.ttf?raw=true";
      name = "Arya-Regular.ttf";
      sha256 = "b02bdacefe31bd544f9332b9b4244168ec23e18be395a573e08f484c2a778879";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/arya/Arya-Bold.ttf?raw=true";
      name = "Arya-Bold.ttf";
      sha256 = "96449d0ec5f452f56c05fd3072115435f41ed3f78d362444b79a8379de2479f4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Arya-Regular.ttf $out/share/fonts/truetype/Arya-Regular.ttf
     install -Dm644 Arya-Bold.ttf $out/share/fonts/truetype/Arya-Bold.ttf
  '';

  meta = with lib; {
    description = "Arya";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
