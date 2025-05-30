{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-vithkuqi-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansvithkuqi/NotoSansVithkuqi%5Bwght%5D.ttf?raw=true";
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
