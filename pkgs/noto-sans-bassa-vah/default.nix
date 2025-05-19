{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-bassa-vah-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansbassavah/NotoSansBassaVah%5Bwght%5D.ttf?raw=true";
      name = "NotoSansBassaVah_wght_.ttf";
      sha256 = "b6c065b905d4ca228580027164f2102fae76215724c43a36e8ebf3c7ee81b8fb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansBassaVah_wght_.ttf $out/share/fonts/truetype/NotoSansBassaVah_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Bassa Vah";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
