{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-sundanese-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanssundanese/NotoSansSundanese%5Bwght%5D.ttf?raw=true";
      name = "NotoSansSundanese_wght_.ttf";
      sha256 = "28282be9cce5a96e6b5baa3cc48044187f65d610879ff29b1dc5fe5ea465df6a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSundanese_wght_.ttf $out/share/fonts/truetype/NotoSansSundanese_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Sundanese";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
