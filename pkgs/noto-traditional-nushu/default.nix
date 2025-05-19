{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-traditional-nushu-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/nototraditionalnushu/NotoTraditionalNushu%5Bwght%5D.ttf?raw=true";
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
