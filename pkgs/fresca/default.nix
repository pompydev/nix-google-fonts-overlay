{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fresca-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/fresca/Fresca-Regular.ttf?raw=true";
      name = "Fresca-Regular.ttf";
      sha256 = "f64340016a820093202ca6af533f232ee7fe4c3d8448601ac42b4091236b5777";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Fresca-Regular.ttf $out/share/fonts/truetype/Fresca-Regular.ttf
  '';

  meta = with lib; {
    description = "Fresca";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
