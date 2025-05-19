{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "briem-hand-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/briemhand/BriemHand%5Bwght%5D.ttf?raw=true";
      name = "BriemHand_wght_.ttf";
      sha256 = "baa74c890e29a80a003ee4b50171daae4f448e5952491c9c2682ef6b5dffb02e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BriemHand_wght_.ttf $out/share/fonts/truetype/BriemHand_wght_.ttf
  '';

  meta = with lib; {
    description = "Briem Hand";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
