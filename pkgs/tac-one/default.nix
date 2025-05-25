{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tac-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/tacone/TacOne-Regular.ttf?raw=true";
      name = "TacOne-Regular.ttf";
      sha256 = "0b52bc2a0d4bb3ba187d1da157d18e50fafa7a3158563293445f809c3c515d77";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TacOne-Regular.ttf $out/share/fonts/truetype/TacOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Tac One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
