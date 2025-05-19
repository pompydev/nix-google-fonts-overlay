{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "foldit-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/foldit/Foldit%5Bwght%5D.ttf?raw=true";
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
