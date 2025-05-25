{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "foldit-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/foldit/Foldit%5Bwght%5D.ttf?raw=true";
      name = "Foldit_wght_.ttf";
      sha256 = "cd0f1932ed7762ce679b4f39dafc181660883b14d97a1260c074a88d3915212e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Foldit_wght_.ttf $out/share/fonts/truetype/Foldit_wght_.ttf
  '';

  meta = with lib; {
    description = "Foldit";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
