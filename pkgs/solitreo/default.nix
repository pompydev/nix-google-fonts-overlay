{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "solitreo-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/solitreo/Solitreo-Regular.ttf?raw=true";
      name = "Solitreo-Regular.ttf";
      sha256 = "0b6df66f2145e8fd013d7324b6a55c6bc0c83c4786a6c7dce7505fdbeb65295b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Solitreo-Regular.ttf $out/share/fonts/truetype/Solitreo-Regular.ttf
  '';

  meta = with lib; {
    description = "Solitreo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
