{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-mongolian-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansmongolian/NotoSansMongolian-Regular.ttf?raw=true";
      name = "NotoSansMongolian-Regular.ttf";
      sha256 = "805a55e10492c547ccadc1ad04faabdef61a74a5c02ecce69748378d66ef032d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMongolian-Regular.ttf $out/share/fonts/truetype/NotoSansMongolian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Mongolian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
