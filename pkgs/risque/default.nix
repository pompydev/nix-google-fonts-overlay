{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "risque-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/risque/Risque-Regular.ttf?raw=true";
      name = "Risque-Regular.ttf";
      sha256 = "84b3d76741a27e63c66af80c24dee25ed58172751d0fcb3a5f4bd582676bfabd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Risque-Regular.ttf $out/share/fonts/truetype/Risque-Regular.ttf
  '';

  meta = with lib; {
    description = "Risque";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
