{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pinyon-script-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/pinyonscript/PinyonScript-Regular.ttf?raw=true";
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
