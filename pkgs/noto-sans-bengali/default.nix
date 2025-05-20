{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-bengali-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansbengali/NotoSansBengali%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansBengali_wdth,wght_.ttf";
      sha256 = "83c25162b92f22ef58de84bec4487c4ec4e704d29ada127a61f02c1c09a63d3d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansBengali_wdth-wght_.ttf $out/share/fonts/truetype/NotoSansBengali_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Bengali";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
