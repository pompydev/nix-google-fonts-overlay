{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bilbo-swash-caps-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bilboswashcaps/BilboSwashCaps-Regular.ttf?raw=true";
      name = "BilboSwashCaps-Regular.ttf";
      sha256 = "36e0a6d9f33c57797340a65c8789272247f8d2b0b9521a92112eaa13c77a4354";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BilboSwashCaps-Regular.ttf $out/share/fonts/truetype/BilboSwashCaps-Regular.ttf
  '';

  meta = with lib; {
    description = "Bilbo Swash Caps";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
