{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-carian-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanscarian/NotoSansCarian-Regular.ttf?raw=true";
      name = "NotoSansCarian-Regular.ttf";
      sha256 = "73f83bf71bac6046bd409f42706cd5e3706bce4521150302be3010ef6a161ecd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansCarian-Regular.ttf $out/share/fonts/truetype/NotoSansCarian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Carian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
