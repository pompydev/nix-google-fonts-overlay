{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "onest-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/onest/Onest%5Bwght%5D.ttf?raw=true";
      name = "Onest_wght_.ttf";
      sha256 = "3faa4b905661849b2332e394b42f91b5bf5575e553c516caa81811e868a4d589";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Onest_wght_.ttf $out/share/fonts/truetype/Onest_wght_.ttf
  '';

  meta = with lib; {
    description = "Onest";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
