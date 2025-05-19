{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bacasime-antique-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bacasimeantique/BacasimeAntique-Regular.ttf?raw=true";
      name = "BacasimeAntique-Regular.ttf";
      sha256 = "7dac1e5f979df3deb933453ed8584a39099a38889d109c1384db1b8bab5f7d28";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BacasimeAntique-Regular.ttf $out/share/fonts/truetype/BacasimeAntique-Regular.ttf
  '';

  meta = with lib; {
    description = "Bacasime Antique";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
