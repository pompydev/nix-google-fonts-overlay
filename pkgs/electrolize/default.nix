{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "electrolize-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/electrolize/Electrolize-Regular.ttf?raw=true";
      name = "Electrolize-Regular.ttf";
      sha256 = "aa81ab9015fc0190bb5e68c50290565c7a4a723ddf32b88774aaff05cdd66bca";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Electrolize-Regular.ttf $out/share/fonts/truetype/Electrolize-Regular.ttf
  '';

  meta = with lib; {
    description = "Electrolize";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
