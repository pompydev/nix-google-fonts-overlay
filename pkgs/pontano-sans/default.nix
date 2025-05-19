{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pontano-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/pontanosans/PontanoSans%5Bwght%5D.ttf?raw=true";
      name = "PontanoSans_wght_.ttf";
      sha256 = "cafd98966b473326a8d6344abb34ec543267f47fb76ca7532855db5a08a0a002";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PontanoSans_wght_.ttf $out/share/fonts/truetype/PontanoSans_wght_.ttf
  '';

  meta = with lib; {
    description = "Pontano Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
