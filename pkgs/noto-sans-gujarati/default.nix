{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-gujarati-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansgujarati/NotoSansGujarati%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansGujarati_wdth,wght_.ttf";
      sha256 = "9901d8552f1dd5d2c50dbd4caa6f6e174e74e8264f06594ab259ae6e7b1ac428";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansGujarati_wdth-wght_.ttf $out/share/fonts/truetype/NotoSansGujarati_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Gujarati";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
