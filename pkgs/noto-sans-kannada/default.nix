{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-kannada-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanskannada/NotoSansKannada%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansKannada_wdth,wght_.ttf";
      sha256 = "4756584c59a25c2e42bdcc06949e6c30b7d48018343560c71860022f9adfd004";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansKannada_wdth-wght_.ttf $out/share/fonts/truetype/NotoSansKannada_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Kannada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
