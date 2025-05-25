{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "workbench-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/workbench/Workbench%5BBLED,SCAN%5D.ttf?raw=true";
      name = "Workbench_BLED,SCAN_.ttf";
      sha256 = "027940fb7aea63f260fb367957e419c08f904f357b384c819f99eb06e7af17d6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Workbench_BLED-SCAN_.ttf $out/share/fonts/truetype/Workbench_BLED-SCAN_.ttf
  '';

  meta = with lib; {
    description = "Workbench";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
