{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-lao-looped-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanslaolooped/NotoSansLaoLooped%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansLaoLooped_wdth,wght_.ttf";
      sha256 = "5bffa09e287f48df6a02915ed4738c0b5b79a0c14e86954970fcf3167af6a8b0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansLaoLooped_wdth-wght_.ttf $out/share/fonts/truetype/NotoSansLaoLooped_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Lao Looped";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
