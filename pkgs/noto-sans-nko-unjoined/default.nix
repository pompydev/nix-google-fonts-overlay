{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-nko-unjoined-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansnkounjoined/NotoSansNKoUnjoined%5Bwght%5D.ttf?raw=true";
      name = "NotoSansNKoUnjoined_wght_.ttf";
      sha256 = "9da7c2cd66449822e9b6014a9d59470c9a20fc4c4b831aebc72d308b93ebc4d4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansNKoUnjoined_wght_.ttf $out/share/fonts/truetype/NotoSansNKoUnjoined_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans NKo Unjoined";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
