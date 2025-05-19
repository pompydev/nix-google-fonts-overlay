{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "patrick-hand-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/patrickhand/PatrickHand-Regular.ttf?raw=true";
      name = "PatrickHand-Regular.ttf";
      sha256 = "0f173b3e6cb6d1af25babf7f0057c5ac4ee11f9992b0469bb817e967ef4ad0fc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PatrickHand-Regular.ttf $out/share/fonts/truetype/PatrickHand-Regular.ttf
  '';

  meta = with lib; {
    description = "Patrick Hand";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
