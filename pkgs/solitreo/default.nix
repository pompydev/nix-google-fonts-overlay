{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "solitreo-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/solitreo/Solitreo-Regular.ttf?raw=true";
      name = "Solitreo-Regular.ttf";
      sha256 = "0b6df66f2145e8fd013d7324b6a55c6bc0c83c4786a6c7dce7505fdbeb65295b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Solitreo-Regular.ttf $out/share/fonts/truetype/Solitreo-Regular.ttf
  '';

  meta = with lib; {
    description = "Solitreo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
