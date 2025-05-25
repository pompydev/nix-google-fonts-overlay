{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-lao-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notoseriflao/NotoSerifLao%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSerifLao_wdth,wght_.ttf";
      sha256 = "c35bb3fbbdbd88c0d8ce5ee13e4854cb51471d9b809108570876b48c8f970df6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifLao_wdth-wght_.ttf $out/share/fonts/truetype/NotoSerifLao_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Lao";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
