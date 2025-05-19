{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-hk-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanshk/NotoSansHK%5Bwght%5D.ttf?raw=true";
      name = "NotoSansHK_wght_.ttf";
      sha256 = "76098ee78ec234cd4f8c950742b3f766fea2f8b43d5180d901048f4fc86c6849";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansHK_wght_.ttf $out/share/fonts/truetype/NotoSansHK_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans HK";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
