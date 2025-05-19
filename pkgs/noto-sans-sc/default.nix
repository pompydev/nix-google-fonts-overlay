{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-sc-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanssc/NotoSansSC%5Bwght%5D.ttf?raw=true";
      name = "NotoSansSC_wght_.ttf";
      sha256 = "a3041811a78c361b1de50f953c805e0244951c21c5bd412f7232ef0d899af0da";
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
