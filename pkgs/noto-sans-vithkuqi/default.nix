{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-vithkuqi-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansvithkuqi/NotoSansVithkuqi%5Bwght%5D.ttf?raw=true";
      name = "NotoSansVithkuqi_wght_.ttf";
      sha256 = "9b7f114c20897d6253fac413a7f66295b6fe18c630202f0564785b6aa79e5067";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansVithkuqi_wght_.ttf $out/share/fonts/truetype/NotoSansVithkuqi_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Vithkuqi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
