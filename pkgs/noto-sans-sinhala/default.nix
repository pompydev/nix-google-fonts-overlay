{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-sinhala-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanssinhala/NotoSansSinhala%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansSinhala_wdth,wght_.ttf";
      sha256 = "9bd93e407a278075be403324063bc94a7e306c44de4df81214e932330c22eecf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSinhala_wdth-wght_.ttf $out/share/fonts/truetype/NotoSansSinhala_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Sinhala";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
