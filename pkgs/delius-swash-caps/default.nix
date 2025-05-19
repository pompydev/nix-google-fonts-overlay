{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "delius-swash-caps-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/deliusswashcaps/DeliusSwashCaps-Regular.ttf?raw=true";
      name = "DeliusSwashCaps-Regular.ttf";
      sha256 = "04c102448007265b8a0672590900919d35dfd26c624e543c8c3bfbab9535b642";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DeliusSwashCaps-Regular.ttf $out/share/fonts/truetype/DeliusSwashCaps-Regular.ttf
  '';

  meta = with lib; {
    description = "Delius Swash Caps";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
