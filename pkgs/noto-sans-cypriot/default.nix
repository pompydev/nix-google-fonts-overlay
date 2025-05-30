{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-cypriot-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanscypriot/NotoSansCypriot-Regular.ttf?raw=true";
      name = "NotoSansCypriot-Regular.ttf";
      sha256 = "80590aed2c4223ee0ca53fda21281236529dcc637451d016248559c83880d14d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansCypriot-Regular.ttf $out/share/fonts/truetype/NotoSansCypriot-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Cypriot";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
