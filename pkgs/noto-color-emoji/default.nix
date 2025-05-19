{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-color-emoji-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notocoloremoji/NotoColorEmoji-Regular.ttf?raw=true";
      name = "NotoColorEmoji-Regular.ttf";
      sha256 = "c7ce73eaacec33f1fdcb6e11a216388aefd0d646d3a87e283aa24f38eb32678a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoColorEmoji-Regular.ttf $out/share/fonts/truetype/NotoColorEmoji-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Color Emoji";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
