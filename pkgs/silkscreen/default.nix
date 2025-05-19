{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "silkscreen-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/silkscreen/Silkscreen-Regular.ttf?raw=true";
      name = "Silkscreen-Regular.ttf";
      sha256 = "c845473330b94c2079ce9af01c51ac8ba2d99c24f4d14c039843bbb8e642ebd8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/silkscreen/Silkscreen-Bold.ttf?raw=true";
      name = "Silkscreen-Bold.ttf";
      sha256 = "768476aa712d4f5c3e18d3bce80f980a8bd3f72b7094d22ec5e768df3acfed61";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Silkscreen-Regular.ttf $out/share/fonts/truetype/Silkscreen-Regular.ttf
     install -Dm644 Silkscreen-Bold.ttf $out/share/fonts/truetype/Silkscreen-Bold.ttf
  '';

  meta = with lib; {
    description = "Silkscreen";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
