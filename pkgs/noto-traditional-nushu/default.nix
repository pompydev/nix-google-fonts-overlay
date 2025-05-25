{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-traditional-nushu-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/nototraditionalnushu/NotoTraditionalNushu%5Bwght%5D.ttf?raw=true";
      name = "NotoTraditionalNushu_wght_.ttf";
      sha256 = "5944d18bbd4cb3422e249177afe2e4a645b58e4265b079809b47a8210ca315e7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoTraditionalNushu_wght_.ttf $out/share/fonts/truetype/NotoTraditionalNushu_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Traditional Nushu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
