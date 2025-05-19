{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "im-fell-french-canon-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/imfellfrenchcanon/IMFeFCrm28P.ttf?raw=true";
      name = "IMFeFCrm28P.ttf";
      sha256 = "3fea76932a62ff94ff93f1cf95b338330674df8ecd16e961116a346a64900dd3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/imfellfrenchcanon/IMFeFCit28P.ttf?raw=true";
      name = "IMFeFCit28P.ttf";
      sha256 = "c52e1ec27251b4cd6663e38415380404ecf39b2ceeb5535d40598590a511e459";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IMFeFCrm28P.ttf $out/share/fonts/truetype/IMFeFCrm28P.ttf
     install -Dm644 IMFeFCit28P.ttf $out/share/fonts/truetype/IMFeFCit28P.ttf
  '';

  meta = with lib; {
    description = "IM Fell French Canon";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
