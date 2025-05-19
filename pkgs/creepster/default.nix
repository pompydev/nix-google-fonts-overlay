{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "creepster-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/creepster/Creepster-Regular.ttf?raw=true";
      name = "Creepster-Regular.ttf";
      sha256 = "402aeb734586c74aecd3dbdc454589b1fb12e2e1c71f782fd019ae68066d9f44";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Creepster-Regular.ttf $out/share/fonts/truetype/Creepster-Regular.ttf
  '';

  meta = with lib; {
    description = "Creepster";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
