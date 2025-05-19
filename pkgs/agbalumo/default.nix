{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "agbalumo-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/agbalumo/Agbalumo-Regular.ttf?raw=true";
      name = "Agbalumo-Regular.ttf";
      sha256 = "02fd8b71c067d2f5f4a9d83ddc09c7377d3c853f94e712afdf4a49a7c20306f4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Agbalumo-Regular.ttf $out/share/fonts/truetype/Agbalumo-Regular.ttf
  '';

  meta = with lib; {
    description = "Agbalumo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
