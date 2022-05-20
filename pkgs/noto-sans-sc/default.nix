{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-sc-${version}";
  version = "2022-05-17-205400";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/111c4438733c9d7cd67581f14fbbdaf320849bb7/ofl/notosanssc/NotoSansSC%5Bwght%5D.ttf?raw=true";
      name = "NotoSansSC_wght_.ttf";
      sha256 = "3b1cf592f34d7f0f2e8c011eedb6147bd1e9ce693ced2276b2cf2d034a4cd4b0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSC_wght_.ttf $out/share/fonts/truetype/NotoSansSC_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
