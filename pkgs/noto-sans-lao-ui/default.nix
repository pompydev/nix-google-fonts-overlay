{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-lao-ui-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanslaoui/NotoSansLaoUI%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansLaoUI_wdth,wght_.ttf";
      sha256 = "beabd7830fe6d6b1e7f622b7212595aa5805cfd7f4fc69a2a769362b3086b7d6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansLaoUI_wdth-wght_.ttf $out/share/fonts/truetype/NotoSansLaoUI_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Lao UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
