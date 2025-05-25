{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "petemoss-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/petemoss/Petemoss-Regular.ttf?raw=true";
      name = "Petemoss-Regular.ttf";
      sha256 = "c15315bba38c1b4fdcc6aadda5bb7aecb9d341121bbc0ea2e23f05bf6fb614c4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Petemoss-Regular.ttf $out/share/fonts/truetype/Petemoss-Regular.ttf
  '';

  meta = with lib; {
    description = "Petemoss";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
