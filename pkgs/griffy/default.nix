{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "griffy-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/griffy/Griffy-Regular.ttf?raw=true";
      name = "Griffy-Regular.ttf";
      sha256 = "c889c3f8d169631386a297eae8b5bdefbf8d06aa9f4f325faec31b9b5f38eeb5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Griffy-Regular.ttf $out/share/fonts/truetype/Griffy-Regular.ttf
  '';

  meta = with lib; {
    description = "Griffy";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
