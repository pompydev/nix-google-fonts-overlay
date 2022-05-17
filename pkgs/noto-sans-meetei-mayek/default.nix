{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-meetei-mayek-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e011c63812ec1b4bb6ff309cd8c2c47cb1706c93/ofl/notosansmeeteimayek/NotoSansMeeteiMayek%5Bwght%5D.ttf?raw=true";
      name = "NotoSansMeeteiMayek_wght_.ttf";
      sha256 = "b5e96c6175044e58d8842634b0f5077610110e75fe194eb434d8cc5121a3387f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMeeteiMayek_wght_.ttf $out/share/fonts/truetype/NotoSansMeeteiMayek_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Meetei Mayek";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
