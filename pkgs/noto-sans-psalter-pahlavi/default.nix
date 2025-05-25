{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-psalter-pahlavi-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanspsalterpahlavi/NotoSansPsalterPahlavi-Regular.ttf?raw=true";
      name = "NotoSansPsalterPahlavi-Regular.ttf";
      sha256 = "1df586f1f62820f7c71c2d6cf9e2c006673a028ec515b0656fb617b0859e4c14";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansPsalterPahlavi-Regular.ttf $out/share/fonts/truetype/NotoSansPsalterPahlavi-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Psalter Pahlavi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
