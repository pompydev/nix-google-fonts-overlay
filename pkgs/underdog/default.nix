{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "underdog-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/underdog/Underdog-Regular.ttf?raw=true";
      name = "Underdog-Regular.ttf";
      sha256 = "33f9aee5b2aaeb85e1f433fb21916d0c6dbae74e23b94d978b8131bdbddc40c6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Underdog-Regular.ttf $out/share/fonts/truetype/Underdog-Regular.ttf
  '';

  meta = with lib; {
    description = "Underdog";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
