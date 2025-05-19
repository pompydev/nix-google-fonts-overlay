{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-ethiopic-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansethiopic/NotoSansEthiopic%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansEthiopic_wdth,wght_.ttf";
      sha256 = "0dbccc00b22d180ebd6a4bd8a733918a29e709fa6798023adc3e6cd40da65077";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansEthiopic_wdth,wght_.ttf $out/share/fonts/truetype/NotoSansEthiopic_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Ethiopic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
