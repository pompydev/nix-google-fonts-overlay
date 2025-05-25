{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bad-script-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/badscript/BadScript-Regular.ttf?raw=true";
      name = "BadScript-Regular.ttf";
      sha256 = "40ec737eee65ec4efbc24ae636fa31d7d84d1ccca83ab54cd555edb72cb3eaf0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BadScript-Regular.ttf $out/share/fonts/truetype/BadScript-Regular.ttf
  '';

  meta = with lib; {
    description = "Bad Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
