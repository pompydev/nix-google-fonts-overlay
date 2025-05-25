{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "just-me-again-down-here-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/justmeagaindownhere/JustMeAgainDownHere.ttf?raw=true";
      name = "JustMeAgainDownHere.ttf";
      sha256 = "0412aa1e460666d339738991b48e9f4bd51e10b6f04e2e1341fce4d2b3244c31";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 JustMeAgainDownHere.ttf $out/share/fonts/truetype/JustMeAgainDownHere.ttf
  '';

  meta = with lib; {
    description = "Just Me Again Down Here";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
