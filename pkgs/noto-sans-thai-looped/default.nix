{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-thai-looped-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansthailooped/NotoSansThaiLooped%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansThaiLooped_wdth,wght_.ttf";
      sha256 = "a6d220ea215bc2c4bfcd5c5efc4103e20302443f87f6dca7a9ce733a11f2cfbd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansThaiLooped_wdth-wght_.ttf $out/share/fonts/truetype/NotoSansThaiLooped_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Thai Looped";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
