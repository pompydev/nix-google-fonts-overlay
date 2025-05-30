{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "electrolize-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/electrolize/Electrolize-Regular.ttf?raw=true";
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
