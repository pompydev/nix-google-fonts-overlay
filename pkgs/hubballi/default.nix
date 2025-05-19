{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hubballi-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/hubballi/Hubballi-Regular.ttf?raw=true";
      name = "Hubballi-Regular.ttf";
      sha256 = "e51ad77d40b5adccd6c6ca537863ef4e364bd374c56593e007fbf5402a9a1cdd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Hubballi-Regular.ttf $out/share/fonts/truetype/Hubballi-Regular.ttf
  '';

  meta = with lib; {
    description = "Hubballi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
