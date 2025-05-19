{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bonbon-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bonbon/Bonbon-Regular.ttf?raw=true";
      name = "Bonbon-Regular.ttf";
      sha256 = "718753f714468e878b2af1c82ec65b68c60ce81732308957c3e90d59bce7ce98";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bonbon-Regular.ttf $out/share/fonts/truetype/Bonbon-Regular.ttf
  '';

  meta = with lib; {
    description = "Bonbon";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
