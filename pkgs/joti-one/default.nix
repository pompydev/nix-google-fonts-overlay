{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "joti-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/jotione/JotiOne-Regular.ttf?raw=true";
      name = "JotiOne-Regular.ttf";
      sha256 = "16d31b49095da1a5c2d3ba5479cd966cff05d3db1d3e235532cb9aef607ef0a9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 JotiOne-Regular.ttf $out/share/fonts/truetype/JotiOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Joti One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
