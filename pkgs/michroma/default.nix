{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "michroma-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/michroma/Michroma-Regular.ttf?raw=true";
      name = "Michroma-Regular.ttf";
      sha256 = "b62301163788bc5b7f8fcac0b74b184e34e1827e577b499ecb724da065098f87";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Michroma-Regular.ttf $out/share/fonts/truetype/Michroma-Regular.ttf
  '';

  meta = with lib; {
    description = "Michroma";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
