{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pinyon-script-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/pinyonscript/PinyonScript-Regular.ttf?raw=true";
      name = "PinyonScript-Regular.ttf";
      sha256 = "4aab130a6ed27f8b8117738c84a5602edf9300cdcc0651a9a65bf96f451ac29a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PinyonScript-Regular.ttf $out/share/fonts/truetype/PinyonScript-Regular.ttf
  '';

  meta = with lib; {
    description = "Pinyon Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
