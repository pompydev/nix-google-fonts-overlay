{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-lines-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/rubiklines/RubikLines-Regular.ttf?raw=true";
      name = "RubikLines-Regular.ttf";
      sha256 = "a02cc9f24672b2eec94620f496d6ec8ef78070c84d4ccd5b5632eb2b0e05cf61";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikLines-Regular.ttf $out/share/fonts/truetype/RubikLines-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Lines";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
