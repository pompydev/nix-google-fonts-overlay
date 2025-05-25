{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "commissioner-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/commissioner/Commissioner%5BFLAR,VOLM,slnt,wght%5D.ttf?raw=true";
      name = "Commissioner_FLAR,VOLM,slnt,wght_.ttf";
      sha256 = "db01279a6eb8676ee62675a4d7e5edbfe5f08fbc109358e2f49760b70c0447d3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Commissioner_FLAR-VOLM-slnt-wght_.ttf $out/share/fonts/truetype/Commissioner_FLAR-VOLM-slnt-wght_.ttf
  '';

  meta = with lib; {
    description = "Commissioner";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
