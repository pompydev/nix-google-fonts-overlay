{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jacques-francois-shadow-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/jacquesfrancoisshadow/JacquesFrancoisShadow-Regular.ttf?raw=true";
      name = "JacquesFrancoisShadow-Regular.ttf";
      sha256 = "3947827a196a3c12ceb471ed589168a9b57285db7258eb468a83f4c17945784c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 JacquesFrancoisShadow-Regular.ttf $out/share/fonts/truetype/JacquesFrancoisShadow-Regular.ttf
  '';

  meta = with lib; {
    description = "Jacques Francois Shadow";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
