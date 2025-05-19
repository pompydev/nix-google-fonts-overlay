{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-malayalam-ui-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansmalayalamui/NotoSansMalayalamUI%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansMalayalamUI_wdth,wght_.ttf";
      sha256 = "6980d9e69af585a3346e21cdaf2e20fcbd292e24db043da679ddf2bf2acb884c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMalayalamUI_wdth,wght_.ttf $out/share/fonts/truetype/NotoSansMalayalamUI_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Malayalam UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
