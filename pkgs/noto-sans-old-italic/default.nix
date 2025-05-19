{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-old-italic-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansolditalic/NotoSansOldItalic-Regular.ttf?raw=true";
      name = "NotoSansOldItalic-Regular.ttf";
      sha256 = "be47cca5000d090c3716c86428afbce436864a67c817271af0b57e450e2b7aab";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOldItalic-Regular.ttf $out/share/fonts/truetype/NotoSansOldItalic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Old Italic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
