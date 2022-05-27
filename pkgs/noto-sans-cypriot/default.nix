{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-cypriot-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanscypriot/NotoSansCypriot-Regular.ttf?raw=true";
      name = "NotoSansCypriot-Regular.ttf";
      sha256 = "4d2a47dfc00ccf8971a3f2273d2c7682128bab03de721f0ee9239a5777e978df";
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
