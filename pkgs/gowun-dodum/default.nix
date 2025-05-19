{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gowun-dodum-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gowundodum/GowunDodum-Regular.ttf?raw=true";
      name = "GowunDodum-Regular.ttf";
      sha256 = "a6e457933227483a11758fd0947bc74422a106d46f0bf057fdaa5af94a30067d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GowunDodum-Regular.ttf $out/share/fonts/truetype/GowunDodum-Regular.ttf
  '';

  meta = with lib; {
    description = "Gowun Dodum";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
