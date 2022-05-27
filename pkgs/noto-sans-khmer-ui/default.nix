{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-khmer-ui-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanskhmerui/NotoSansKhmerUI%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansKhmerUI_wdth,wght_.ttf";
      sha256 = "1467a1828bfbfe6598127482e7c3d3d7c82bed213d4d54e3066dce5d980db77b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansKhmerUI_wdth,wght_.ttf $out/share/fonts/truetype/NotoSansKhmerUI_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Khmer UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
