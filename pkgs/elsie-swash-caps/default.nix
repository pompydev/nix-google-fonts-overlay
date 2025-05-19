{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "elsie-swash-caps-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/elsieswashcaps/ElsieSwashCaps-Regular.ttf?raw=true";
      name = "ElsieSwashCaps-Regular.ttf";
      sha256 = "6b9c2d61e6f955e4cc7bc51777a2e411c2034d921d150473098b9c7554734520";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/elsieswashcaps/ElsieSwashCaps-Black.ttf?raw=true";
      name = "ElsieSwashCaps-Black.ttf";
      sha256 = "6961a1cda97a11a9783151670529a01dab5e44a84cd1029a44c95270b72b26bd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ElsieSwashCaps-Regular.ttf $out/share/fonts/truetype/ElsieSwashCaps-Regular.ttf
     install -Dm644 ElsieSwashCaps-Black.ttf $out/share/fonts/truetype/ElsieSwashCaps-Black.ttf
  '';

  meta = with lib; {
    description = "Elsie Swash Caps";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
