{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-kayah-li-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanskayahli/NotoSansKayahLi%5Bwght%5D.ttf?raw=true";
      name = "NotoSansKayahLi_wght_.ttf";
      sha256 = "477e12ed1a0255e8b51f4228d0fa66fc740a0b546d632a82d3080c37fdd087f5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansKayahLi_wght_.ttf $out/share/fonts/truetype/NotoSansKayahLi_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Kayah Li";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
