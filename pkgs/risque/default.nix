{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "risque-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/risque/Risque-Regular.ttf?raw=true";
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
