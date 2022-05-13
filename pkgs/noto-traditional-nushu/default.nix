{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-traditional-nushu-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/nototraditionalnushu/NotoTraditionalNushu-Regular.ttf?raw=true";
      name = "NotoTraditionalNushu-Regular.ttf";
      sha256 = "04b2fe18447e8794ea5226b1479074bccb86cf8e44639fff41e9d5a5f3457999";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoTraditionalNushu-Regular.ttf $out/share/fonts/truetype/NotoTraditionalNushu-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Traditional Nushu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
