{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "im-fell-dw-pica-sc-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/imfelldwpicasc/IMFePIsc28P.ttf?raw=true";
      name = "IMFePIsc28P.ttf";
      sha256 = "7fc01c056b20956bf2e84375340a6274332b67f7845cbbb479fe0b90b41f845d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IMFePIsc28P.ttf $out/share/fonts/truetype/IMFePIsc28P.ttf
  '';

  meta = with lib; {
    description = "IM Fell DW Pica SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
