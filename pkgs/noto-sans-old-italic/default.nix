{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-old-italic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansolditalic/NotoSansOldItalic-Regular.ttf?raw=true";
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
